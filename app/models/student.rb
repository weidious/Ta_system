class Student < ApplicationRecord
    has_one:offer
    has_many:application
end
