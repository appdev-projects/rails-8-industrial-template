require "rails_helper"

RSpec.describe "Testing", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "test spec" do
    visit "/"
    
    expect(page).to have_content("Books")
  end
end
