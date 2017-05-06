class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :phone
      t.string :city
      t.string :state
      t.boolean :approved

      t.timestamps
    end
  end
end
