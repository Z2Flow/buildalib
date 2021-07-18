require "application_system_test_case"

class AuthsTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  test "visiting the index" do
    visit signup_url

# Nothing filled in
    click_on "Sign up"
    assert_selector "h2", text: "Create your account"
    # TODO: test callout bubble
    # TODO: test manual, empty POST

# Invalid email
    fill_in "Email", with: "yogi@trb"
    click_on "Sign up"
    assert_selector "h2", text: "Create your account"
    assert_selector ".error", text: "Email invalid."
    assert_selector "#signup_email[value='yogi@trb']"

# Invalid password
    fill_in "Email", with: "yogi@trb.to"
    click_on "Sign up"
    assert_selector "h2", text: "Create your account"
    assert_selector ".error", text: "Password does not meet requirements."

  end
end
