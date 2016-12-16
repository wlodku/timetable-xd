class Group < ActiveRecord::Base
  has_many :lessons
  belongs_to :squad
end
