require "rails_helper"

RSpec.describe "Testing", type: :system do
  it "test spec (no driver, js: true)", js: true do
    visit "/"
    
    expect(page).to have_content("Books")
  end
end
