class Contact < ActiveRecord::Base
  has_many :phones

  validates_presence_of :firstname, :lastname, :email
  validates :email, uniqueness: true

  def name
    "#{firstname} #{lastname}"
  end
end
