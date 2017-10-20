class Course < ApplicationRecord
  belongs_to :instructor
  has_many :applies
end
