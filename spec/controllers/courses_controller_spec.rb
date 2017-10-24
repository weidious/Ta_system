require 'rails_helper'

RSpec.describe CoursesController, type: :controller do


	before(:each) do
	    @instructor = create(:instructor)
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
    
    
    it "test_index" do
        get :index
        expect(response).to render_template("index")
    end
    
    it "test_show" do
        get :show, params: {id: create(:course).id}
        expect(response).to render_template("show")
    end
          
  
  describe 'test_new' do
    it "should render template new" do
      get :new
      expect(response).to render_template("new")
    end
  
    it "should create a new course" do
      #post :new, {:course => {:subject => "CSCE", :num => 606, :section => 600, :title => "Soft Engi", :instructor_id => @instructor.id}}
      post :create, params: {course: {subject: "CSCE", num: 606, section: 600, title: "Soft Engi", instructor_id: @instructor.id}}
      expect(flash[:notice]).to be_present
      #expect(subject).to redirect_to :action => :index
    end
    
    it "should not create a course without name" do
      post :create, params: {course: {num: ""}}
      expect(flash[:error]).to be_present
    end
  end

  describe "test_edit" do
    before(:each) do
      get :edit, params: {:id => create(:course).id}
    end

    it 'should render template edit' do
      assert_template 'edit'
    end

  end

  describe "test_update" do
    it "successfully update" do
      post :update, params: {id: create(:course).id, course: attributes_for(:course)}
      expect(flash[:notice]).to be_present
    end
    
    it "should fail to update with blank name" do
      post :update, params: {id: create(:course).id, course: {num: ""}}
      expect(flash[:error]).to be_present
    end
  end

  describe "test_destroy" do
      it "test_destroy with POST" do
        test_id = create(:course).id
        #get :destroy, params: {id: test_id}
    
        post :destroy, params: {id: test_id}
    
        expect(flash[:notice]).to be_present
      end
  end
    
end
