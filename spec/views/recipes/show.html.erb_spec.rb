require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    assign(:recipe, Recipe.create!(
      name: "Name",
      preparation_time: "Preparation Time",
      cooking_time: "Cooking Time",
      description: "MyText",
      public: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Preparation Time/)
    expect(rendered).to match(/Cooking Time/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
