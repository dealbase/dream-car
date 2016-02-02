require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :name => "Name",
        :amount => 1.5
      ),
      Car.create!(
        :name => "Name",
        :amount => 1.5
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
