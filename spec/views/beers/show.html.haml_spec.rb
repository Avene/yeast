require 'rails_helper'

RSpec.describe "beers/show", :type => :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :name => "Name",
      :beer_type => 1,
      :taste => "Taste"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Taste/)
  end
end
