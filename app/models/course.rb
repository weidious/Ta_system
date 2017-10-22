class Course < ApplicationRecord
  belongs_to :instructor, optional: true
  has_many :applies, :dependent => :delete_all
  has_many :offers, :dependent => :delete_all
  validates :title, presence: true, length: { minimum: 3, maximum: 127}
  validates :num, presence: true
  validates_inclusion_of :num, in: 100..999
end
