class AddCopyToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :copy, :string
  end
end
