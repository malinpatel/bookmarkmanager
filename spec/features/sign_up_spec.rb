require 'spec_helper.rb'
require_relative 'web_helpers.rb'


feature 'sign up for bookmark manager' do

  scenario 'user can fill out sign up form' do
    sign_up
  end

  scenario 'user gets redirected to links after signing up ' do
    sign_up
    expect(page.current_path).to eq '/links'
  end

  scenario 'links shows a welcome message' do
    visit '/links'
    expect(page).to have_content('Welcome!')
  end

  scenario 'welcome message shows user email addres' do
    visit '/links'
    expect(page).to have_content("Welcome! test@test.com")
  end

end
