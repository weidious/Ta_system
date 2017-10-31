class Instructor < ApplicationRecord
    has_many :course, :dependent => :nullify
    validates :first_name, presence: true, length: { minimum: 3, maximum: 127}
    validates :last_name, presence: true, length: { minimum: 3, maximum: 127}
    validates :email, presence: true, length: { minimum: 3, maximum: 127}, :email_format => { :message => 'is not looking good' }
    validates :uin, presence: true
    validates_inclusion_of :uin, in: 100000000..9999999999
    
    def fullname
        first_name + " " + (middle_name || "") + " " + last_name
    end
end
