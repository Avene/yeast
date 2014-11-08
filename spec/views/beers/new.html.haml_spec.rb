require 'rails_helper'

RSpec.describe "beers/new", :type => :view do
  before(:each) do
    assign(:beer, Beer.new(
      :name => "MyString",
      :beer_type => 1,
      :taste => "MyString"
    ))
  end

  it "renders new beer form" do
    render

    assert_select "form[action=?][method=?]", beers_path, "post" do

      assert_select "input#beer_name[name=?]", "beer[name]"

      assert_select "input#beer_beer_type[name=?]", "beer[beer_type]"

      assert_select "input#beer_taste[name=?]", "beer[taste]"
    end
  end
end
