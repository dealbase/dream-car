require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :name => "MyString",
      :amount => 1.5
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_name[name=?]", "car[name]"

      assert_select "input#car_amount[name=?]", "car[amount]"
    end
  end
end
