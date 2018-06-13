class ChangePriceToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :male_betta, :price, :integer
  end
end
