def sign_up
  visit '/sign_up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'submit'
end
