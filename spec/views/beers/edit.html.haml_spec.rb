require 'rails_helper'

RSpec.describe "beers/edit", :type => :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :name => "MyString",
      :beer_type => 1,
      :taste => "MyString"
    ))
  end

  it "renders the edit beer form" do
    render

    assert_select "form[action=?][method=?]", beer_path(@beer), "post" do

      assert_select "input#beer_name[name=?]", "beer[name]"

      assert_select "input#beer_beer_type[name=?]", "beer[beer_type]"

      assert_select "input#beer_taste[name=?]", "beer[taste]"
    end
  end
end
