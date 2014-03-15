class Contact < ActiveRecord::Base
  has_many :phones

  def name
    "#{firstname} #{lastname}"
  end
end
