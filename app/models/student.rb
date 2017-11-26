class Student < ApplicationRecord
    has_one :offer, dependent: :nullify
    has_many :applies
    has_many :courses, through: :applies
    validates :netID, presence: true
    validates :uin, presence: true
    validates_inclusion_of :uin, in: 100000000..999999999, :uniqueness => true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, length: {maximum: 31}
    validates_email_format_of :email, :message => 'email address is not looking good'
    
    def fullname
        first_name + " " + (middle_name || " ") + " " + last_name
    end
end
