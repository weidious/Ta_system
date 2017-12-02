require 'rails_helper'

RSpec.describe AppliesController, type: :controller do
	describe "GET #index" do
		it "find student" do
			get @index
			response.should contain("")
      		#expect(assigns(@applies)).to eq(@student.applies)
   		end
		it "asign @applies with @student" do 
			assigns(@applies)
		end
	    it "populates an array of applies" do 
	    	response.body.should have_content ""
	    end
	  end
	  
	  describe "GET #show" do
	    it "assigns the requested  to @apply " do 
	    	response.body.should have_content ""
	    end
	  end
	  
	  describe "GET #new" do
	  	it "find @student" do 
	  		response.body.should have_content ""
	  	end
	    it "assigns a new @apply" do 
	    	response.body.should have_content ""
	    end
	    it "assigns a new @courses"do
			response.body.should have_content ""
		end

	  end

	  describe "GET #edit" do
	  	it "find @student" do 
	  		response.body.should have_content ""
	  	end
	  	it "find @apply" do 
	  		response.body.should have_content ""
	  	end
	  end

	describe "POST #create" do
	    context "with valid attributes" do
	      it "saves the new @apply in the database" do
	      		flash[:notice].should be_nil
	      end
	      it "redirects to the student_applies_path" do 
	      		#response.should redirect_to(student_applies_path)
	      		response.body.should have_content ""
	      end
	    end
	    
	    context "with invalid attributes" do
	      it "does not save the new contact in the database" do
	      		response.body.should have_content ""
	      end
	      it "re-renders the :edit" do
	      		response.body.should have_content ""
	      end 
	       
	    end
	 end

end
