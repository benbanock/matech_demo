class AddPriceToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :price, :string, default: "empty"
  end
end
