def sign_up
  visit '/sign_up_form'
  fill_in("Email Address", with:"test@test.com")
  fill_in("Password", with: "password")
  click_button("Sign Up")
end
