feature 'adding tags to links' do
  scenario 'categorise links by adding tags' do
    visit '/links/new'
    fill_in 'title', with: 'MA'
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'tags', with: 'Coding'

    click_button("Save")
    link = Link.first
    expect(link.tags.map(&:name)).to include('Coding') 
  end
end
