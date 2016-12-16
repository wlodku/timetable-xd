class Teacher < ActiveRecord::Base
  has_many :lessons
  has_many :squads
end
