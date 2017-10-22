require 'rails_helper'

RSpec.describe CoursesController, type: :controller do


	before :each do
	    
	end
	
    it ' course -> instructor can be null ' do
    #         t.string :subject
    #   t.integer :num
    #   t.integer :section
    #   t.string :title
    @cs = Course.new(subject:"csce", num:"999", section:123,
        title:"super class")
        
    @cs.save!
    
    puts("@cs.id", @cs.id)
    expect(@cs.instructor_id).to be nil
    expect(@cs.instructor).to be nil
    
    
    end

end
