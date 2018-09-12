class AddSuppliersToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :suppliers, :string
  end
end
