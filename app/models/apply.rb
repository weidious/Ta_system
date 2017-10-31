class Apply < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :student, optional: true
  validates :course_id, presence: true
  #validates :student_id, presence: true
  validates :appType, presence: true
  validates_inclusion_of :appType, in: 1..3
  #validates :priority
  validates :positive, presence: true
  validates :acceptAdjust, presence: true
  #validates :takenBefore, presence: true
  
  def self.appTypeEnum(i)
    case i
    when 1
      'TA'
    when 2
      'Senior Grader'
    else
      'Grader'
    end
  end
  
  def appTypeCaption
    Apply.appTypeEnum(appType)
  end
  
end
