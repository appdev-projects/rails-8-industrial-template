require "rails_helper"

RSpec.describe "Testing 2", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "test spec 2 (selenium chrome headless)" do
    visit "/"
    
    expect(page).to have_content("Books")
  end
end
