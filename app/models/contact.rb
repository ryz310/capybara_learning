class Contact < ActiveRecord::Base
  has_many :phones

  validates_presence_of :firstname, :lastname, :email
  validates :email, uniqueness: true

  def self.by_letter(letter)
    where("lastname like ?", "#{letter}%").order(:lastname)
  end

  def name
    "#{firstname} #{lastname}"
  end
end
