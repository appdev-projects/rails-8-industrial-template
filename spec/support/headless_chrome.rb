Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")

  # Use Chrome installed by bin/chromedriver_install when present (codespaces),
  # so its version matches our pinned chromedriver. Otherwise Selenium Manager
  # auto-downloads a newer Chrome our pinned chromedriver can't drive.
  chrome_binary = "/usr/local/bin/google-chrome"
  options.binary = chrome_binary if File.exist?(chrome_binary)

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_max_wait_time = 3

Capybara.javascript_driver = :headless_chrome
