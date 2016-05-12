require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @model_object = FactoryGirl.create(:model_object)
  end

  subject { @model_object }

  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should be_valid }

  describe "when field is not present" do
    before { @model_object.field = " " }
    it { expect(@model_object).to_not be_valid }
  end

  describe "when field is too long" do
    before { @model_object.field = "Z" * 51 }
    it { expect(@model_object).to_not be_valid }
  end

  describe "when model_object field" do
    before do
      project_with_same_field = @model_object.dup
      project_with_same_field.save
    end
    it { expect(@model_object).to_not be_valid }
  end
end
