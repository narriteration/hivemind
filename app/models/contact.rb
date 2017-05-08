class Contact < ApplicationRecord

  belongs_to :user, optional: true
  has_many :texts

end
