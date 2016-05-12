FactoryGirl.define do
  factory(:project) do
    name  "testName"
    description "test description of test project"
    purpose "purpose is to test tests"
    technology "Ruby, FactoryGirl, etc"
    url "http://testUrl.com"
    image "app/assets/images/testImage.jpg"
  end

  factory :invalid_project, parent: :project do |f|
    f.name nil
  end
end
