class Apply < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :student, optional: true
  #validates :course_id, presence: true
  #validates :student_id, presence: true
  #validates :appType, presence: true, in: 1..3
  #validates :priority
  #validates :positive, presence: true
  #validates :acceptAdjust, presence: true
  #validates :takenBefore, presence: true
end
