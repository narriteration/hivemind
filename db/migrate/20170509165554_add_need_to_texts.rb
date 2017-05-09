class AddNeedToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :need, :string
  end
end
