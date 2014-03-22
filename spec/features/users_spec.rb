require 'spec_helper'

feature 'User Management', js: true do
  background do
    create(:user, name: 'John', email: 'hoge@mail.com')
    visit root_path
  end

  scenario 'add a new user' do
    expect{
      click_link 'New User'
      fill_in 'Name', with: 'user name'
      fill_in 'Password', with: 'password'
      fill_in 'Email', with: 'test@mail.com'
      click_button 'Create User'
    }.to change(User, :count).by(1)
  end

  scenario 'show user list' do
    click_link 'Show'
    expect(page).to have_content 'John'
  end

  scenario 'edit user name' do
    click_link 'Edit'
    fill_in 'Name', with: 'Jack'
    click_button 'Update User'
    expect(page).to have_content 'Jack'
  end

  scenario 'delete user' do
    expect{
      click_link 'Destroy'
    }.to change(User, :count).by(-1)
  end
end
