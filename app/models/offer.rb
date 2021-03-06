class Offer < ApplicationRecord
  belongs_to :course
  belongs_to :student, optional:true
  
  enum app_type: [ :ta, :senior_grader, :grader ]
  enum status: [ :available, :unsent, :sent, :rejected, :accepted ]
  
end
