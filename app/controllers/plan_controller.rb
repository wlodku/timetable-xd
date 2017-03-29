class PlanController < ApplicationController
  before_action :clear_session

  def clear_session
    session[:title] = nil
  end

  def index
    # @teachers = Teacher.all
    # @doc = @doc.xpath("//teacher")

    # @cards = Card.fromclass(1).fromday(2)
      # @cards = Card.fromteacher(13).fromday(1)
      @cards = Card.fromclass(4)

  end

  def classroomsplan
    id = params[:id]
    @cards = Card.fromclassroom(id)
    session[:title] = Classroom.find(id).short

    @cards_monday = @cards.fromday(1)
    @cards_tuesday = @cards.fromday(2)
    @cards_wednesday = @cards.fromday(3)
    @cards_thursday = @cards.fromday(4)
    @cards_friday = @cards.fromday(5)

    @periods = ['6:55 - 7:40', '7:45 - 8:30', '8:40 - 9:25', '9:35 - 10:20', '10:30 - 11:15', '11:30 - 12:15', '12:25 - 13:10', '13:20 - 14:05', '14:15 - 15:00', '15:05 - 15:50', '15:55 - 16:40', '16:45 - 17:30']
    @min = @cards.minimum(:period)
    @max = @cards.maximum(:period)
    @range = @min..@max
    minXD = @min == 0 ? -1 : @min-1
    # @max = 7
    Setting.max = @max - minXD
  end
  def squadsplan
    id = params[:id]
    @cards = Card.fromclass(id)
    session[:title] = Squad.find(id).short

    @cards_monday = @cards.fromday(1)
    @cards_tuesday = @cards.fromday(2)
    @cards_wednesday = @cards.fromday(3)
    @cards_thursday = @cards.fromday(4)
    @cards_friday = @cards.fromday(5)

    @periods = ['6:55 - 7:40', '7:45 - 8:30', '8:40 - 9:25', '9:35 - 10:20', '10:30 - 11:15', '11:30 - 12:15', '12:25 - 13:10', '13:20 - 14:05', '14:15 - 15:00', '15:05 - 15:50', '15:55 - 16:40', '16:45 - 17:30']
    @min = @cards.minimum(:period)
    @max = @cards.maximum(:period)
    @range = @min..@max
    minXD = @min == 0 ? -1 : @min-1
    # @max = 7
    Setting.max = @max - minXD

  end

  def teachersplan
    id = params[:id]
    @cards = Card.fromteacher(id)
    session[:title] = Teacher.find(id).name.tr('_', '')

    @cards_monday = @cards.fromday(1)
    @cards_tuesday = @cards.fromday(2)
    @cards_wednesday = @cards.fromday(3)
    @cards_thursday = @cards.fromday(4)
    @cards_friday = @cards.fromday(5)

    @periods = ['6:55 - 7:40', '7:45 - 8:30', '8:40 - 9:25', '9:35 - 10:20', '10:30 - 11:15', '11:30 - 12:15', '12:25 - 13:10', '13:20 - 14:05', '14:15 - 15:00', '15:05 - 15:50', '15:55 - 16:40', '16:45 - 17:30']
    @min = @cards.minimum(:period)
    @max = @cards.maximum(:period)
    @range = @min..@max
    minXD = @min == 0 ? -1 : @min-1

    Setting.max = @max - minXD
  end

  def new
    # unless user_signed_in?
    #   redirect_to action: 'index'
    # end
  end

  def add
    # unless user_signed_in?
    #   redirect_to action: 'index'
    # end
  
    Card.delete_all
    Classroom.delete_all
    Group.delete_all
    Lesson.delete_all
    Squad.delete_all
    Subject.delete_all
    Teacher.delete_all  
    LessonSquad.delete_all

    # url = params[:url]
    url = 'https://dl.dropbox.com/s/rc0t83swz5uqsdk/planxml2012.xml'
    require 'open-uri'
    doc = Nokogiri::HTML(open(url).read) unless url.blank?

    teachers = doc.xpath("//teacher")
    subjects = doc.xpath("//subject")
    groups = doc.xpath("//group")
    squads = doc.xpath("//class")
    classrooms = doc.xpath("//classroom")
    cards = doc.xpath("//card")
    lessons = doc.xpath("//lesson")

    teachers.each do |node|
      Teacher.create(id: node['id'][1..-1].to_i, name: node['name'], short: node['short'], color: node['color'])
    end

    subjects.each do |node|
      Subject.create(id: node['id'][1..-1].to_i, short: node['short'])
    end

    groups.each do |node|
      Group.create(id: node['id'][1..-1].to_i, name: node['name'], divisiontag: node['divisiontag'], squad_id: node['classid'][1..-1].to_i)
    end

    squads.each do |node|
      Squad.create(id: node['id'][1..-1].to_i, short: node['short'], teacher_id: node['teacherid'][1..-1].to_i)
    end

    classrooms.each do |node|
      Classroom.create(id: node['id'][1..-1].to_i, short: node['short'])
      # node['classroomids'].split(",").each {|c| c.classrooms << Classroom.find(c[1..-1].to_i)} 
    end

    cards.each do |node|
      # Card.create(day: node['day'].to_i, period: node['period'].to_i, classroom_id: node['classroomids'].to_i, lesson_id: node['lessonid'].to_i)
      Card.create(day: node['day'].to_i, period: node['period'].to_i, lesson_id: node['lessonid'][1..-1].to_i, classroom_id: node['classroomids'][1..-1].to_i)
    end

    lessons.each do |node|
      # add new lesson
      l = Lesson.create(id: node['id'][1..-1].to_i, teacher_id: node['teacherids'][1..-1].to_i, subject_id: node['subjectid'][1..-1].to_i, group_id: node['groupids'][1..-1].to_i, classroomids: node['classroomids'], periodspercard: node['periodspercard'].to_i)
      # add associasions
      node['classids'].split(",").each {|n| l.squads << Squad.find(n[1..-1].to_i)}      
    end

    render 'new'
  end

end
