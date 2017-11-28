# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

list_inst = []
_lines = File.readlines(File.dirname(__FILE__) + "/courses_seeds_scripts/instructors.txt")
_idx = 0
while _idx < _lines.length do
    if _lines[_idx].nil? || _lines[_idx].empty? || _lines[_idx].blank?
        _idx += 1
    else
        raw_name = _lines[_idx + 1].split(' ')
        fname = raw_name[0]
        mname = ""
        lname = ""
        if (raw_name.length > 2)
            mname = raw_name[1]
            lname = raw_name[2]
        else
            lname = raw_name[1]
        end
        cont = true
        _i = 2
        raw_email = _lines[_idx + 5]
        while cont && _i < 7
            if _lines[_idx + _i].index("Email:") == 0
                raw_email = _lines[_idx + _i]
                cont = false
            end
            _i += 1
        end
        email = raw_email[6, raw_email.length - 6]
        nid = ""
        e2 = email.split('@')
        if (e2.length > 1)
            nid = e2[0]
        end
        ninst = Instructor.create(first_name:fname, middle_name:mname, last_name:lname, email:email, netID:nid, uin:rand(123450000..123459999))
        list_inst << ninst
      _idx += 6
    end
end

# Fake students
list_student = []
(1..10).each {|i|
    ll = rand(0..2)
    ae = nil
    if (ll > 0)
        ae = list_inst.sample.email
    end
    stu = Student.create(uin:rand(100000000..999999999), first_name:"fn#{i}", last_name:"ln#{i}",
    email:"stu#{i}@tamu.edu", netID:"stu#{i}", level:ll, assigned:false, phone:(9790000000 + rand(0..9999999)),
    advisor_email:ae, can_ta:true, can_grader:true, can_sgrader:true)
    list_student << stu
}


 File.open(File.dirname(__FILE__) + "/courses_seeds_scripts/Under_courses.txt", "r") do |f|
    f.each_line do |line|
   	    list = line.split()
   	    courses = Course.create(subject: list[0], num: list[1], section: 600, title: list[2..list.length()].join(" "),
        instructor_id: list_inst.sample.id)
    end
 end
 File.open(File.dirname(__FILE__) + "/courses_seeds_scripts/Grad_courses.txt", "r") do |f|
    f.each_line do |line|
        list = line.split()
        courses = Course.create(subject: list[0], num: list[1], section: 600, title: list[2..list.length()].join(" "),
        instructor_id: list_inst.sample.id)
    end
 end


@all_courses = Course.all
puts(@all_courses.length)

@list_ta_apply = []
(1..5).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:"ta", priority:i,
    acceptAdjust:true, takenBefore:true, grade:"A")
    @list_ta_apply.push(app)
}

@list_grader_apply = []
(1..3).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:"grader", priority:i,
    acceptAdjust:true, takenBefore:false)
    @list_grader_apply.push(app)
}

@list_sgrader_apply = []
(1..3).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:"senior_grader", priority:i,
    acceptAdjust:false, takenBefore:true, grade:"B")
    @list_sgrader_apply.push(app)
}

@course_with_candidates = @all_courses.sample

@course_with_candidates.ta_candidate_1 = @list_ta_apply.sample.student.id
@course_with_candidates.ta_candidate_2 = @list_ta_apply.sample.student.id
@course_with_candidates.ta_candidate_3 = @list_ta_apply.sample.student.id

@course_with_candidates.grader_candidate_1 = @list_grader_apply.sample.student.id
@course_with_candidates.grader_candidate_2 = @list_grader_apply.sample.student.id

@course_with_candidates.sgrader_candidate_1 = @list_sgrader_apply.sample.student.id

@course_with_candidates.save!

puts("Dev>>> course_with_candidates ")
for attribute in @course_with_candidates.attributes.keys
    puts(attribute.to_s + " => " + @course_with_candidates.attributes[attribute].to_s)
end


