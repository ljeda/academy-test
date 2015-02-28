# Feature: Restricted navigation links
#   As a logged in user
#   I want to see navigation links
#   So I can find home, edit account, sign out, or users
feature 'Restricted navigation links', :devise do

  # Scenario: View restricted navigation links
  #   Given I am a logged in user
  #   When I visit the home page
  #   Then I see "home," "edit account," "sign out," and "users"
  scenario 'view restricted navigation links' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Edit account'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'Users'
  end

  # Scenario: Routes correctly to custom users route
  #   Given I am a logged in user
  #   When I visit the home page
  #   And I click on Users link
  #   Then I am on /all_users page
  scenario 'routes correctly to custom users route' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit users_path
    current_path.should eq('/all_users')
  end

end
