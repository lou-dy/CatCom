class AddBettaToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :male_bettum_id, :integer
  end
end
