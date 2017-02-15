class LessonSquad < ActiveRecord::Base
	belongs_to :lesson
	belongs_to :squad
end
