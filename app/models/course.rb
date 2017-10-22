class Course < ApplicationRecord
  belongs_to :instructor, optional: true
  has_many :applies
end
