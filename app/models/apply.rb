class Apply < ApplicationRecord
  belongs_to :course
  belongs_to :student
  validates :course_id, presence: true
  validates :student_id, presence: true
  validates :appType, presence: true
  validates :positive, inclusion: { in: [true, false] }
  validates :acceptAdjust, inclusion: { in: [true, false] }
  #validates :acceptAdjust, exclusion: { in: [nil] }
  validates :takenBefore, inclusion: { in: [true, false] }
  
  enum appType: [ :ta, :senior_grader, :grader ]
  
  def self.to_csv
    attributes = %w{id email name}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
  
  # def self.appTypeEnum(i)
  #   case i
  #   when 1
  #     'TA'
  #   when 2
  #     'Senior Grader'
  #   else
  #     'Grader'
  #   end
  # end
  
  # def appTypeCaption
  #   Apply.appTypeEnum(appType)
  # end
  
end
