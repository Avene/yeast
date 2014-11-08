require 'rails_helper'

RSpec.describe "beers/index", :type => :view do
  before(:each) do
    assign(:beers, [
      Beer.create!(
        :name => "Name",
        :beer_type => 99,
        :taste => "Taste"
      ),
      Beer.create!(
        :name => "Name",
        :beer_type => 99,
        :taste => "Taste"
      )
    ])
  end

  it "renders a list of beers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 99.to_s, :count => 2
    assert_select "tr>td", :text => "Taste".to_s, :count => 2
  end
end
