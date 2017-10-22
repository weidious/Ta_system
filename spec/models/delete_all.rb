
require 'rails_helper'

RSpec.describe Course, type: :model do

   
   it "let's truncate all tables" do
 	  Offer.delete_all
 	  Apply.delete_all
 	  Student.delete_all
 	  Course.delete_all
 	  Instructor.delete_all
 	  puts("All tables truncated!")
  end
  
 end
