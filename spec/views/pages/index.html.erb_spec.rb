require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :amount => 1.5
      ),
      Page.create!(
        :amount => 1.5
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
