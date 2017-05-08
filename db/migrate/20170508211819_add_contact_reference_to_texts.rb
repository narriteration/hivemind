class AddContactReferenceToTexts < ActiveRecord::Migration[5.0]
  def change
    add_reference :texts, :contact, foreign_key: true
  end
end
