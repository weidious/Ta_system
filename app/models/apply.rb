class Apply < ApplicationRecord
  belongs_to :course
  belongs_to :student
  validates :course_id, presence: true
  validates :student_id, presence: true
  validates :appType, presence: true
  validates_inclusion_of :appType, in: 1..3
  #validates :priority
  #validates :positive, presence: true
  validates :positive, inclusion: { in: [true, false] }
  #validates :acceptAdjust, presence: true
  validates :acceptAdjust, inclusion: { in: [true, false] }
  #validates :acceptAdjust, exclusion: { in: [nil] }
  #validates :takenBefore, presence: true
  validates :takenBefore, inclusion: { in: [true, false] }
  
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
