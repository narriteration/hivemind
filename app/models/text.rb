class Text < ApplicationRecord

  belongs_to :contact, optional: true

  # enum emotion: ["sad", "frustrated", "guilty", "anxious", "nervous"]

end
