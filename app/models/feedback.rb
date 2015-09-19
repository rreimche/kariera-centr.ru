class Feedback < ActiveRecord::Base
  belongs_to :course
  validates :content, presence: true
  validates :course_id, presence: true
end
