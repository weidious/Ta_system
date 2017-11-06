# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

list_inst = []
(1..5).each {|i|
    inst = Instructor.create(first_name:"fn #{i}", last_name:"ln#{i}", email:"inst#{i}@tamu.edu", uin:rand(100000000..999999999))
    list_inst << inst
}

list_student = []
(1..10).each {|i|
    stu = Student.create(uin:rand(100000000..999999999), first_name:"fn#{i}", last_name:"ln#{i}",
    email:"stu#{i}@tamu.edu", level:rand(1..3), assigned:false, phone:(9790000000 + rand(0..9999999)),
    advisor_email:list_inst.sample.email, can_ta:true, can_grader:true, can_sgrader:true)
    list_student << stu
}

Instructor.create(first_name:"Tanzir", middle_name:"", last_name:"Ahmed", email:"tanzir@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Nancy", middle_name:"M.", last_name:"Amato", email:"amato@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Flemming", middle_name:"", last_name:"Andersen", email:"flemminglandersen@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Riccardo", middle_name:"", last_name:"Bettati", email:"bettati@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"James", middle_name:"", last_name:"Caverlee", email:"caverlee@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Jinxiang", middle_name:"", last_name:"Chai", email:"jchai@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Theodora", middle_name:"", last_name:"Chaspari", email:"chaspari@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Jianer", middle_name:"", last_name:"Chen", email:"chen@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Yoonsuck", middle_name:"", last_name:"Choe", email:"choe@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Dilma", middle_name:"Da", last_name:"Silva", email:"dilma@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Walter", middle_name:"", last_name:"Daugherity", email:"daugher@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Tim", middle_name:"", last_name:"Davis", email:"davis@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Paula", middle_name:"", last_name:"deWitte", email:"paula.dewitte@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Richard", middle_name:"", last_name:"Furuta", email:"furuta@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Juan", middle_name:"", last_name:"Garay", email:"garay@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Bruce", middle_name:"", last_name:"Gooch", email:"gooch@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Guofei", middle_name:"", last_name:"Gu", email:"guofei@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Ricardo", middle_name:"", last_name:"Gutierrez-Osuna", email:"rgutier@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Tracy", middle_name:"Anne", last_name:"Hammond", email:"hammond@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Xia", middle_name:"", last_name:"Hu", email:"hu@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Jeff", middle_name:"", last_name:"Huang", email:"jeff@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Ruihong", middle_name:"", last_name:"Huang", email:"huangrh@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Thomas", middle_name:"R.", last_name:"Ioerger", email:"ioerger@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Roozbeh", middle_name:"", last_name:"Jafari", email:"rjafari@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Anxiao", middle_name:"", last_name:"Jiang", email:"ajiang@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Daniel", middle_name:"A.", last_name:"Jiménez", email:"djimenez@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Andruid", middle_name:"", last_name:"Kerne", email:"andruid@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"John", middle_name:"", last_name:"Keyser", email:"keyser@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Eun", middle_name:"Jung", last_name:"Kim", email:"ejkim@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Andreas", middle_name:"", last_name:"Klappenecker", email:"klappi@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Hyunyoung", middle_name:"", last_name:"Lee", email:"hlee@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Teresa", middle_name:"", last_name:"Leyk", email:"teresa19@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Jyh-Charn", middle_name:"", last_name:"Liu", email:"liu@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Dmitri", middle_name:"", last_name:"Loguinov", email:"dmitri@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Shawn", middle_name:"", last_name:"Lupoli", email:"slupoli@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Rabi", middle_name:"N.", last_name:"Mahapatra", email:"rabi@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"J.", middle_name:"Michael", last_name:"Moore", email:"jmichael@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Bobak", middle_name:"", last_name:"Mortazavi", email:"bobakm@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Robin", middle_name:"", last_name:"Murphy", email:"murphy@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Daniel", middle_name:"", last_name:"Ragsdale", email:"rags@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Lawrence", middle_name:"", last_name:"Rauchwerger", email:"rwerger@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Philip", middle_name:"", last_name:"Ritchey", email:"ritchey@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Vivek", middle_name:"", last_name:"Sarin", email:"sarin@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Scott", middle_name:"", last_name:"Schaefer", email:"schaefer@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Dylan", middle_name:"", last_name:"Shell", email:"dshell@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Frank", middle_name:"M.", last_name:"Shipman", email:"shipman@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Dezhen", middle_name:"", last_name:"Song", email:"dzsong@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Radu", middle_name:"", last_name:"Stoleru", email:"stoleru@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Shinjiro", middle_name:"", last_name:"Sueda", email:"sueda@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Sing-Hoi", middle_name:"", last_name:"Sze", email:"shsze@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Aakash", middle_name:"", last_name:"Tyagi", email:"tyagi@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Duncan", middle_name:"M.", last_name:"Walker", email:"walker@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Zhangyang", middle_name:"", last_name:"Wang", email:"atlaswang@tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Jennifer", middle_name:"", last_name:"Welch", email:"welch@cse.tamu.edu", uin:rand(123450000..123459999))
Instructor.create(first_name:"Tiffani", middle_name:"L.", last_name:"Williams", email:"tlw@cse.tamu.edu", uin:rand(123450000..123459999))

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

# courses = Course.create(subject: "CSCE", num: 606, section: 600, title: "Software Engineering",
#     instructor_id: list_inst.sample.id)

# courses = Course.create(subject: "CSCE", num: 608, section: 600, title: "Database System",
#     instructor_id: list_inst.sample.id)
    
# courses = Course.create(subject: "CSCE", num: 633, section: 600, title: "Machine Learning",
#     instructor_id: list_inst.sample.id)
    
# courses = Course.create(subject: "CSCE", num: 670, section: 600, title: "Information Retreival",
#     instructor_id: list_inst.sample.id)
    
# courses = Course.create(subject: "CSCE", num: 613, section: 600, title: "Operating System",
#     instructor_id: list_inst.sample.id)
    
# courses = Course.create(subject: "CSCE", num: 671, section: 600, title: "Seminar",
#     instructor_id: list_inst.sample.id)
    
# Course.create(subject: "CSCE", num: 110, section: 600, title: "Programming I",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 111, section: 600, title: "Introduction to Computer Science Concepts and Programming",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 113, section: 600, title: "Intermediate Programming and Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 121, section: 600, title: "Introduction to Program Design and Concepts",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 181, section: 600, title: "Introduction to Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 206, section: 600, title: "Structured Programming in C",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 221, section: 600, title: "Data Structures and Algorithms",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 222, section: 600, title: "ECEN 222 Discrete Structures for Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 285, section: 600, title: "Directed Studies",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 289, section: 600, title: "Special Topics in...",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 291, section: 600, title: "Research",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 310, section: 600, title: "Database Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 312, section: 600, title: "Computer Organization",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 313, section: 600, title: "Introduction to Computer Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 314, section: 600, title: "Programming Languages",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 315, section: 600, title: "Programming Studio",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 350, section: 600, title: "ECEN 350 Computer Architecture and Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 399, section: 600, title: "High-Impact Experience",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 410, section: 600, title: "Operating Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 411, section: 600, title: "Design and Analysis of Algorithms",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 420, section: 600, title: "Artificial Intelligence",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 431, section: 600, title: "Software Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 433, section: 600, title: "Formal Languages and Automata",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 434, section: 600, title: "Compiler Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 435, section: 600, title: "Parallel Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 436, section: 600, title: "Computer-Human Interaction",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 438, section: 600, title: "Distributed Objects Programming",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 440, section: 600, title: "Quantum Algorithms",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 441, section: 600, title: "Computer Graphics",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 442, section: 600, title: "Scientific Programming",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 443, section: 600, title: "VIST 487 Game Development",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 444, section: 600, title: "Structures of Interactive Information",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 445, section: 600, title: "Computers and New Media",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 451, section: 600, title: "Software Reverse Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 452, section: 600, title: "Robotics and Spatial Intelligence",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 456, section: 600, title: "Real-Time Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 462, section: 600, title: "Microcomputer Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 463, section: 600, title: "Networks and Distributed Processing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 464, section: 600, title: "Wireless and Mobile Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 465, section: 600, title: "Computer and Network Security",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 469, section: 600, title: "Advanced Computer Architecture",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 470, section: 600, title: "Information Storage and Retrieval",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 481, section: 600, title: "Seminar",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 482, section: 600, title: "Senior Capstone Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 483, section: 600, title: "Computer Systems Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 485, section: 600, title: "Directed Studies",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 489, section: 600, title: "Special Topics in...",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 491, section: 600, title: "Research",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 601, section: 600, title: "Programming with C and Java",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 602, section: 600, title: "Object-Oriented Programming, Development and Software Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 603, section: 600, title: "Database Systems and Applications",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 604, section: 600, title: "Programming Languages",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 605, section: 600, title: "Compiler Design",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 606, section: 600, title: "Software Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 608, section: 600, title: "Database Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 610, section: 600, title: "Hypertext/Hypermedia Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 611, section: 600, title: "Operating Systems and Applications",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 612, section: 600, title: "Applied Networks and Distributed Processing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 613, section: 600, title: "Operating Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 614, section: 600, title: "Computer Architecture",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 616, section: 600, title: "Introduction to Hardware Design Verification",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 617, section: 600, title: "Co-Design of Embedded Systems (CODES)",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 619, section: 600, title: "Networks and Distributed Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 620, section: 600, title: "VIZA 670 Computational Geometry",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 621, section: 600, title: "Language, Library, and Program Design Using C++",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 622, section: 600, title: "Generic Programming",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 624, section: 600, title: "Sketch Recognition",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 625, section: 600, title: "Artificial Intelligence",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 626, section: 600, title: "Parallel Algorithm Design and Analysis",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 627, section: 600, title: "Theory of Computability",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 628, section: 600, title: "BICH 628 Computational Biology",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 629, section: 600, title: "Analysis of Algorithms",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 630, section: 600, title: "Speech Processing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 631, section: 600, title: "Intelligent Agents",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 633, section: 600, title: "Machine Learning",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 634, section: 600, title: "Intelligent User Interfaces",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 635, section: 600, title: "AI Robotics",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 636, section: 600, title: "Neural Networks",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 637, section: 600, title: "Complexity Theory",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 638, section: 600, title: "Natural Language Processing: Foundations and Techniques",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 639, section: 600, title: "MEEN 676 Fuzzy Logic and Intelligent Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 640, section: 600, title: "Quantum Algorithms",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 641, section: 600, title: "VIZA 672 Computer Graphics",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 643, section: 600, title: "Seminar in Intelligent Systems and Robotics",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 644, section: 600, title: "Cortical Networks",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 645, section: 600, title: "VIZA 675 Geometric Modeling",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 646, section: 600, title: "VIZA 654 The Digital Image",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 647, section: 600, title: "VIZA 656 Image Synthesis",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 648, section: 600, title: "VIZA 657 Computer Aided Sculpting",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 649, section: 600, title: "VIZA 659 Physically-Based Modeling",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 652, section: 600, title: "Software Reverse Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 653, section: 600, title: "Computer Methods in Applied Sciences",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 654, section: 600, title: "Supercomputing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 655, section: 600, title: "Human-Centered Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 656, section: 600, title: "Computers and New Media",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 657, section: 600, title: "PETE 657 High Performance Computing for Earth Science and Petroleum Engineering",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 658, section: 600, title: "Randomized Algorithms.",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 659, section: 600, title: "ECEN 659 Parallel/Distributed Numerical Algorithms and Applications",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 660, section: 600, title: "MATH 660 Computational Linear Algebra",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 661, section: 600, title: "Integrated Systems Design Automation",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 662, section: 600, title: "Distributed Processing Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 663, section: 600, title: "Real-Time Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 664, section: 600, title: "Wireless and Mobile Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 665, section: 600, title: "Advanced Networking and Security",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 666, section: 600, title: "Pattern Analysis",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 667, section: 600, title: "Seminar in Human-Centered Computing",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 668, section: 600, title: "Distributed Algorithms and Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 669, section: 600, title: "Computational Optimization",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 670, section: 600, title: "Information Storage and Retrieval",
#     instructor_id: list_inst.sample.id)

# Course.create(subject: "CSCE", num: 671, section: 600, title: "Computer-Human Interaction")

# Course.create(subject: "CSCE", num: 672, section: 600, title: "Computer Supported Collaborative Work",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 675, section: 600, title: "Digital Libraries",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 680, section: 600, title: "ECEN 680 Testing and Diagnosis of Digital Systems",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 681, section: 600, title: "Seminar",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 684, section: 600, title: "Professional Internship",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 685, section: 600, title: "Directed Studies",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 689, section: 600, title: "Special Topics in...",
#     instructor_id: list_inst.sample.id)
# Course.create(subject: "CSCE", num: 691, section: 600, title: "Research",
#     instructor_id: list_inst.sample.id)
    


@all_courses = Course.all

@list_ta_apply = []
(1..5).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:1, priority:i,
    acceptAdjust:true, takenBefore:true, grade:"A")
    @list_ta_apply.push(app)
}

@list_grader_apply = []
(1..3).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:2, priority:i,
    acceptAdjust:true, takenBefore:false)
    @list_grader_apply.push(app)
}

@list_sgrader_apply = []
(1..3).each { |i|
    app = Apply.create(course:@all_courses.sample, student:list_student.sample, appType:3, priority:i,
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

puts("DEBUG>>> course_with_candidates ")
for attribute in @course_with_candidates.attributes.keys
    puts(attribute.to_s + " => " + @course_with_candidates.attributes[attribute].to_s)
end



