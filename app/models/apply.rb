class Apply < ApplicationRecord
  belongs_to :course
  belongs_to :student
  validates :course_id, presence: true
  validates :student_id, presence: true
  validates :appType, presence: true
  validates :positive, inclusion: { in: [true, false] }
  validates :acceptAdjust, inclusion: { in: [true, false] }
  validates :takenBefore, inclusion: { in: [true, false] }
  
  enum appType: [ :ta, :senior_grader, :grader ]
  
end
