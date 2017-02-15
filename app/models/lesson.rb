class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject, dependent: :delete
  belongs_to :group
  
  has_many :lesson_squads  
  has_many :squads, through: :lesson_squads

  has_many :cards



end
