class AddActionToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :action, :string
  end
end
