require 'spec_helper'

describe Contact do
  it 'is valid with a firstname, lastname, and email' do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without a fitstname' do
    expect(build(:contact, firstname: nil)).to have(1).errors_on(:firstname)
  end

  it 'is invalid without a lastname' do
    expect(build(:contact, lastname: nil)).to have(1).errors_on(:lastname)
  end

  it 'is invalid without an email address' do
    expect(build(:contact, email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with a duplicate email address' do
    create(:contact, email: 'example@test.com')
    contact = build(:contact, email: 'example@test.com')
    expect(contact).to have(1).errors_on(:email)
  end

  it "returns a contact's full name as a string" do
    contact = create(:contact, firstname: 'John', lastname: 'Doe')
    expect(contact.name).to eq 'John Doe'
  end
end
