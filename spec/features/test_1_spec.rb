require "rails_helper"

RSpec.describe "Testing 1", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "test spec 1 (rack test)" do
    visit "/"
    
    expect(page).to have_content("Books")
  end
end
