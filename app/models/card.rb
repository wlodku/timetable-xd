class Card < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :classroom
end
