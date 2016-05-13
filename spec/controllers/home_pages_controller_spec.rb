require 'rails_helper'

RSpec.describe HomePagesController, type: :controller do
  include Capybara::DSL

  describe "GET #index" do
    it 'assigns @objects_name' do
      pending("Change object_name to appropriate name")
      expect(RSpec).to receive(:deprecate)
      object_name = FactoryGirl.create(:object_name)
      get :index
      assigns(:objects_name).should eq([object_name])
    end
    it 'renders the index template' do
      get :index
      response.should have_http_status(200)
      response.should render_template("index")
    end
  end

  describe "GET #new" do
    it 'assigns a new object_name to @object_name' do
      pending
    end

    it 'renders the new template' do
      pending
      get :new
      response.should have_http_status(200)
      response.should render_template("new")
    end
  end

  describe "GET #show" do
    it 'assigns the requested object_name to @object_name' do
      pending
      object_name = FactoryGirl.create(:object_name)
      get :show, id: object_name
      assigns(:object_name).should eq(object_name)
    end
    it 'renders the :show template' do
      pending
      project_id = FactoryGirl.create(:object_name).id
      visit "/objects_name/#{project_id}"
      response.should have_http_status(200)
      response.should render_template("show")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'creates a new object_name' do
        pending
        expect {
          post :create, object_name: FactoryGirl.attributes_for(:object_name)
        }.to change(Project, :count).by(1)
      end

      it 'redirects to the new object_name' do
        pending
        post :create, object_name: FactoryGirl.attributes_for(:object_name)
        response.should redirect_to Project.last
      end
    end

    context "with invalid attributes" do
      it 'does not save the new object_name in the database' do
        pending
        expect {
          post :create, object_name: FactoryGirl.attributes_for(:invalid_project)
        }.to_not change(Project, :count)
      end

      it 're-renders the :new template' do
        pending
        post :create, object_name: FactoryGirl.attributes_for(:invalid_project)
        response.should render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested object_name to @object_name" do
      pending
      object_name = FactoryGirl.create(:object_name)
      get :edit, id: object_name
      assigns(:object_name).should eq(object_name)
    end

    it "renders the :edit template" do
      pending
      object_name = FactoryGirl.create(:object_name)
      get :edit, id: object_name
      response.should have_http_status(200)
      response.should render_template("edit")
    end
  end

  describe "PUT #update" do
    before :each do
      pending
      @object_name = FactoryGirl.create(:object_name)
    end

    context "with valid attributes" do
      it 'located the requested @object_name' do
        pending
        put :update, id: @object_name, object_name: FactoryGirl.attributes_for(:object_name)
        assigns(:object_name).should eq(@object_name)
      end

      it "changes @object_name's attributes"  do
        pending
        put :update, id: @object_name,
        object_name: FactoryGirl.attributes_for(:object_name, name: "Example App", description: "Example description", purpose: "To show my portfolio", technology: "Ruby on Rails", url: "http://dillondowney.herokuapp.com", image: "/app/assets/images/example.jpg")
        @object_name.reload
        @object_name.name.should eq("Example App")
        @object_name.description.should eq("Example description")
        @object_name.purpose.should eq("To show my portfolio")
        @object_name.technology.should eq("Ruby on Rails")
        @object_name.url.should eq("http://dillondowney.herokuapp.com")
        @object_name.image.should eq("/app/assets/images/example.jpg")
      end

      it 'redirects to the updated object_name' do
        pending
        put :update, id: @object_name, object_name: FactoryGirl.attributes_for(:object_name)
        response.should redirect_to @object_name
      end

      it { response.should have_http_status(200) }
    end

    context "with invalid attributes" do
      it 'locates the requested @object_name' do
        pending
        put :update, id: @object_name, object_name: FactoryGirl.attributes_for(:invalid_project)
        assigns(:object_name).should eq(@object_name)
      end

      it "does not change @object_name's attributes" do
        pending
        put :update, id: @object_name,
        object_name: FactoryGirl.attributes_for(:object_name, name: nil, description: "Example description", purpose: "To show my portfolio", technology: "Ruby on Rails", url: "http://dillondowney.herokuapp.com", image: "/app/assets/images/example.jpg")
        @object_name.reload
        @object_name.name.should_not eq("testName")
        @object_name.description.should eq("Example description")
        @object_name.purpose.should eq("To show my portfolio")
        @object_name.technology.should eq("Ruby on Rails")
        @object_name.url.should eq("http://dillondowney.herokuapp.com")
        @object_name.image.should eq("/app/assets/images/example.jpg")
      end

      it "re-renders the edit method" do
        pending
        put :update, id: @object_name, object_name:   FactoryGirl.attributes_for(:invalid_project)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      pending
      @object_name = FactoryGirl.create(:object_name)
    end

    context "when destroy action is successful" do
      it 'removes the object_name from the database' do
        pending
        expect {
          delete :destroy, id: @object_name
        }.to change(Project, :count).by(-1)
      end

      it { response.should have_http_status(200) }

      it 'redirects to the objects_name#index' do
        pending
        delete :destroy, id: @object_name
        response.should redirect_to projects_path
      end
    end

    context "When destroy action is not successful" do
      it "redirects to the previous page" do
        pending
      end
    end
  end
end
