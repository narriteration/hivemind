class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.string :body
      t.string :signature

      t.timestamps
    end
  end
end
