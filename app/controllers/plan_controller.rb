class PlanController < ApplicationController
  def index
    # @teachers = Teacher.all
    # @doc = @doc.xpath("//teacher")

    @cards = Card.all


  end

  def new

  end

  def add
    Card.delete_all
    Classroom.delete_all
    Group.delete_all
    Lesson.delete_all
    Squad.delete_all
    Subject.delete_all
    Teacher.delete_all

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
    end

    cards.each do |node|
      # Card.create(day: node['day'].to_i, period: node['period'].to_i, classroom_id: node['classroomids'].to_i, lesson_id: node['lessonid'].to_i)
      Card.create(day: node['day'].to_i, period: node['period'].to_i, lesson_id: node['lessonid'][1..-1].to_i)
    end

    lessons.each do |node|
      Lesson.create(id: node['id'][1..-1].to_i, teacher_id: node['teacherids'][1..-1].to_i, subject_id: node['subjectid'][1..-1].to_i, group_id: node['groupids'][1..-1].to_i, squad_id: node['classids'][1..-1].to_i, classroomids: node['classroomids'], periodspercard: node['periodspercard'].to_i)
    end

    render 'new'
  end

end
