class Course < ApplicationRecord
  belongs_to :instructor, optional: true
  has_many :applies, :dependent => :delete_all
  has_many :students, through: :applies
  has_many :offers, :dependent => :delete_all
  validates :title, presence: true, length: { minimum: 3, maximum: 127}
  validates :num, presence: true
  validates_inclusion_of :num, in: 100..999
  
  def caption
    subject + ' ' + num.to_s + '-' + section.to_s + '  ' + title
  end
  
  def ta_candidate_ids
    [ta_candidate_1, ta_candidate_2, ta_candidate_3, ta_candidate_4, ta_candidate_5].compact
  end
  
  def sgrader_candidate_ids
    [sgrader_candidate_1, sgrader_candidate_2, sgrader_candidate_3, sgrader_candidate_4, sgrader_candidate_5].compact
  end
  
  def grader_candidate_ids
    [grader_candidate_1, grader_candidate_2, grader_candidate_3, grader_candidate_4, grader_candidate_5].compact
  end
  
  after_create :generate_offers
  
  def generate_offers
    if self.num_ta.nil?
      self.num_ta = 1
    end
    if self.num_sgrader.nil?
      self.num_sgrader = 0
    end
    if self.num_grader.nil?
      self.num_grader = 0
    end
    
    self.num_ta.times do
      self.offers.create( {app_type: "ta", status: "available"} )
    end
    self.num_sgrader.times do
      self.offers.create( {app_type: "senior_grader", status: "available"} )
    end
    self.num_grader.times do
      self.offers.create( {app_type: "grader", status: "available"} )
    end
  end
  
end
