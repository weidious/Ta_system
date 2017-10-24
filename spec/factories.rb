

FactoryBot.define do 
  factory :instructor do
    first_name              "fff"
    middle_name             ""
    last_name               "lll"
    email                   "ab@bc.com"
    uin                     123456789
  end
  factory :course do
      subject               "CSCE"
      num                   606
      section               600
      title                 "Soft"
      #instructor_id         1
  end
end