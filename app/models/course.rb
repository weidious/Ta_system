class Course < ApplicationRecord
    validates :title, presence: true
    validates :num, presence: true
    validates_inclusion_of :num, in: 100..999
end
