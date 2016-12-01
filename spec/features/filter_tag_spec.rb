require 'spec_helper'

feature "Tag filtering" do
  before (:each) do
    Link.create(title: "Google", url: 'www.google.com', tags: [Tag.create(name: 'search')])
    Link.create(title: 'BubbleMania', url: 'www.bubblemania.com', tags: [Tag.create(name: 'bubbles')])
  end

  scenario "on bubbles" do
    visit '/tags/bubbles'
    expect(page).to have_content 'BubbleMania'
    expect(page).not_to have_content 'Google'
  end
end
