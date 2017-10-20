#!/bin/bash
rails generate model instructor uin:integer first_name:string middle_name:string last_name:string email:string

#when delete and re-generate model:
#  rails destroy model student
#  rake db:drop student
#
#  rails generate model student
#  rake db:create
#   rake db:migrate
#  rake db:seed 

rails generate model student \
uin:integer first_name:string middle_name:string last_name:string \
level: integer \
email:string \
phone: string \
assigned: boolean \
advisor_email: string \
can_ta: boolean \
can_grader: boolean \
can_sgrader: boolean \
perferences: string \
date_enrolled: date \
last_modified: timestamp

rails generate model Course \
subject:string num:integer section:integer title:string \
instructor_id:integer \
num_ta:integer num_grader:integer num_sgrader:integer \
requirement_ta:text requirement_grader:text requirement_sgrader:text \
ta_candidate_1:integer ta_candidate_2:integer ta_candidate_3:integer ta_candidate_4:integer ta_candidate_5:integer \
grader_candidate_1:integer grader_candidate_2:integer grader_candidate_3:integer grader_candidate_4:integer grader_candidate_5:integer \
sgrader_candidate_1:integer sgrader_candidate_2:integer sgrader_candidate_3:integer sgrader_candidate_4:integer sgrader_candidate_5:integer

rails generate model Apply \
course:references student:references \
appType:integer priority:integer positive:boolean acceptAdjust:boolean \
takenBefore:boolean grade:string \
createdAt:timestamp

rails generate model Offer \
course:references student:references app_type:integer \
student_accepted:boolean instructor_accepted:boolean \
created_at:timestamp


# rails generate controller instructor
