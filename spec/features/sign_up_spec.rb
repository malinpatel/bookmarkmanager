feature "Sign Up" do

  let(:email) { "test@test.com" }
  let(:password){ "iloveunicorns" }

  scenario "goes to links pages after sign up" do
    sign_up
    expect(current_path).to include 'links'
  end

  scenario "displays welcome message" do
    sign_up
    expect(page).to have_content "Welcome"
    expect(page).to have_content email
  end

end
