require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  include Capybara::DSL

  describe "GET #index" do
    it 'assigns @projects' do
      expect(RSpec).to receive(:deprecate)
      project = FactoryGirl.create(:project)
      get :index
      assigns(:projects).should eq([project])
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it 'assigns a new project to @project' do
      pending("todo")
      raise
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do
    it 'assigns the requested project to @project' do
      project = FactoryGirl.create(:project)
      get :show, id: project
      assigns(:project).should eq(project)
    end
    it 'renders the :show template' do
      Project_id = FactoryGirl.create(:project).id
      visit "/projects/#{Project_id}"
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'creates a new project' do
        expect {
          post :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project, :count).by(1)
      end

      it 'redirects to the new project' do
        post :create, project: FactoryGirl.attributes_for(:project)
        response.should redirect_to Project.last
      end
    end

    context "with invalid attributes" do
      it 'does not save the new project in the database' do
        expect {
          post :create, project: FactoryGirl.attributes_for(:invalid_project)
        }.to_not change(Project, :count)
      end

      it 're-renders the :new template' do
        post :create, project: FactoryGirl.attributes_for(:invalid_project)
        response.should render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested project to @project" do
      project = FactoryGirl.create(:project)
      get :edit, id: project
      assigns(:project).should eq(project)
    end
  end

  describe "PUT #update" do
    before :each do
      @project = FactoryGirl.create(:project)
    end

    context "with valid attributes" do
      it 'located the requested @project' do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project)
        assigns(:project).should eq(@project)
      end

      it "changes @project's attributes"  do
        put :update, id: @project,
        project: FactoryGirl.attributes_for(:project, name: "Example App", description: "Example description", purpose: "To show my portfolio", technology: "Ruby on Rails", url: "http://dillondowney.herokuapp.com", image: "/app/assets/images/example.jpg")
        @project.reload
        @project.name.should eq("Example App")
        @project.description.should eq("Example description")
        @project.purpose.should eq("To show my portfolio")
        @project.technology.should eq("Ruby on Rails")
        @project.url.should eq("http://dillondowney.herokuapp.com")
        @project.image.should eq("/app/assets/images/example.jpg")
      end

      it 'redirects to the updated project' do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project)
        response.should redirect_to @project
      end
    end

    context "with invalid attributes" do
      it 'locates the requested @project' do
        put :update, id: @project, project: FactoryGirl.attributes_for(:invalid_project)
        assigns(:project).should eq(@project)
      end

      it "does not change @project's attributes" do
        put :update, id: @project,
        project: FactoryGirl.attributes_for(:project, name: nil, description: "Example description", purpose: "To show my portfolio", technology: "Ruby on Rails", url: "http://dillondowney.herokuapp.com", image: "/app/assets/images/example.jpg")
        @project.reload
        @project.name.should_not eq("testName")
        @project.description.should eq("Example description")
        @project.purpose.should eq("To show my portfolio")
        @project.technology.should eq("Ruby on Rails")
        @project.url.should eq("http://dillondowney.herokuapp.com")
        @project.image.should eq("/app/assets/images/example.jpg")
      end

      it "re-renders the edit method" do
        put :update, id: @project, project:   FactoryGirl.attributes_for(:invalid_project)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @project = FactoryGirl.create(:project)
    end

    context "when destroy action is successful" do
      it 'removes the project from the database' do
        expect {
          delete :destroy, id: @project
        }.to change(Project, :count).by(-1)
      end

      it 'redirects to the projects#index' do
        delete :destroy, id: @project
        response.should redirect_to projects_path
      end
    end
  end
end
