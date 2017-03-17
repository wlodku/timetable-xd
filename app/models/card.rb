class Card < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :classroom


  # scope :fromclass, -> (id) {joins(:lesson => :squad).where('lessons.lesson_squads.squad.id = ?', id)}
  scope :fromclass, -> (id) {joins(:lesson => :squads).where(:squads => {:id => id})}
  scope :fromday, -> (nr) {where(day: nr-1).order(period: :asc)}
  scope :fromperiod, -> (nr) {where(period: nr)}

  scope :fromteacher, -> (id) {joins(:lesson).where('lessons.teacher_id = ?', id)}
  scope :fromclassroom, -> (id) {where('classroom_id = ?', id)}
end
