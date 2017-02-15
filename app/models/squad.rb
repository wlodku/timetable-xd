class Squad < ActiveRecord::Base	
  has_many :lesson_squads  
  has_many :lessons, through: :lesson_squads
  has_many :groups
  belongs_to :teacher
end
