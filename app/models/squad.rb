class Squad < ActiveRecord::Base
  has_many :lessons
  has_many :groups
  belongs_to :teacher
end
