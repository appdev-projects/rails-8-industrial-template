require "rails_helper"

RSpec.describe "Testing", type: :system do
  it "test spec (no driver, no js: true)" do
    visit "/"
    
    expect(page).to have_content("Books")
  end
end
