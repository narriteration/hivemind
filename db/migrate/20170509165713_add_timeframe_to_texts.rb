class AddTimeframeToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :timeframe, :string
  end
end
