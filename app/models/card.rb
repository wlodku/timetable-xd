class Card < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :classroom


  scope :fromclass, -> (id) {joins(:lesson).where('lessons.squad_id = ?', id)}
  scope :fromday, -> (nr) {where(day: nr-1).order(period: :asc)}

  scope :fromteacher, -> (id) {joins(:lesson).where('lessons.teacher_id = ?', id)}
  scope :fromclassroom, -> (id) {where('classroom_id = ?', id)}
end
