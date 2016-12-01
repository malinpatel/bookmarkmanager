def sign_up
  visit '/sign_up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_again', with: password
  click_button 'submit'
end
