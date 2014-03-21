require 'spec_helper'

feature 'User Management' do
  scenario 'add a new user', js: true do
    visit root_path
    expect{
      click_link 'New User'
      fill_in 'Name', with: 'user name'
      fill_in 'Password', with: 'password'
      fill_in 'Email', with: 'test@mail.com'
      click_button 'Create User'
    }.to change(User, :count).by(1)
  end
end
