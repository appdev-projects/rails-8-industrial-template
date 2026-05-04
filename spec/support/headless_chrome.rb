# When chrome-headless-shell + chromedriver are present from bin/chromedriver_install
# (codespaces), pin them globally so EVERY Chrome-based driver picks them up --
# our custom :headless_chrome below, Rails' built-in :selenium_chrome_headless,
# anything. Without this Selenium Manager auto-downloads its own (full) Chrome
# and chromedriver into ~/.cache/selenium/, and the downloaded Chrome can't
# run on the codespace image (no GTK libs), so chromedriver dies at startup.
chrome_binary = "/usr/local/bin/chrome-headless-shell"
chromedriver_binary = "/usr/local/bin/chromedriver"
if File.exist?(chrome_binary) && File.exist?(chromedriver_binary)
  Selenium::WebDriver::Chrome.path = chrome_binary
  Selenium::WebDriver::Chrome::Service.driver_path = chromedriver_binary
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_max_wait_time = 3

Capybara.javascript_driver = :headless_chrome
