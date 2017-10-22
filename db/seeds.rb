# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

list_inst = []
(1..5).each {|i|
    inst = Instructor.create(first_name:"fn #{i}", last_name:"lname#{i}", email:"email#{i}@tamu.edu", uin:rand(100000000..9999999999))
    list_inst << inst
}
# File.open(File.dirname(__FILE__) + "/Under_courses.txt", "r") do |f|
#   f.each_line do |line|
#   	list = line.split()
#   	courses = Course.create(subject: list[0], num: list[1], section: 600, title: list[2..list.length()].join(" "),
#     instructor_id: list_inst.sample.id)

#   end
# end
courses = Course.create(subject: "CSCE", num: 606, section: 600, title: "Software Engineering",
    instructor_id: list_inst.sample.id)

courses = Course.create(subject: "CSCE", num: 608, section: 600, title: "Database System",
    instructor_id: list_inst.sample.id)
    
courses = Course.create(subject: "CSCE", num: 633, section: 600, title: "Machine Learning",
    instructor_id: list_inst.sample.id)
    
courses = Course.create(subject: "CSCE", num: 670, section: 600, title: "Information Retreival",
    instructor_id: list_inst.sample.id)
    
courses = Course.create(subject: "CSCE", num: 613, section: 600, title: "Operating System",
    instructor_id: list_inst.sample.id)
    
courses = Course.create(subject: "CSCE", num: 671, section: 600, title: "Seminar",
    instructor_id: list_inst.sample.id)
    
