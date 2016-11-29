feature 'creating links' do
  scenario 'adding links to list' do
    visit '/links/new'
    fill_in 'title', with: 'MA'
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button("Save")
    within 'ul#links' do
      expect(page).to have_content('MA')
    end
  end
end
