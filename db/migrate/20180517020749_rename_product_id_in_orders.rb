class RenameProductIdInOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :product_id, :male_bettum_id
  end
end
