class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject, dependent: :delete
  belongs_to :group
  belongs_to :squad
  has_many :cards



end
