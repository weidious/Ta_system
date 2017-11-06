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
  
  after_create :generate_offers
  
  def generate_offers
    self.offers.create( {app_type: "ta", status: "available"} )
    self.offers.create( {app_type: "grader", status: "available"} )
    self.offers.create( {app_type: "senior_grader", status: "available"} )
  end
  
end
