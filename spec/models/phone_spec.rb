require 'spec_helper'

describe Phone do
  it 'does not allow duplicate phone numbers per contact' do
    contact = create(:contact)
    contact.phones.create(phone_type: 'home',   phone: '090-1234-5678')
    mobile_phone = contact.phones.create(phone_type: 'mobile', phone: '090-1234-5678')
    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it 'allows two contacts to share a phone number' do
    contact = create(:contact)
    contact.phones.create(phone_type: 'home', phone: '090-1234-5678')
    other_contact = create(:contact, email: 'other@email.com')
    other_phone = other_contact.phones.build(phone_type: 'home', phone: '090-1234-5678')

    expect(other_phone).to be_valid
  end
end
