class AddEmotionToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :emotion, :string
  end
end
