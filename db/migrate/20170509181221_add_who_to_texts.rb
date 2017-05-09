class AddWhoToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :who, :string
  end
end
