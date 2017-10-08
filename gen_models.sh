#!/bin/bash
rails generate model instructor uin:integer first_name:string middle_name:string last_name:string email:string

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


# rails generate controller instructor
