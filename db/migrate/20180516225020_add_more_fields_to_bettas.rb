class AddMoreFieldsToBettas < ActiveRecord::Migration[5.1]
  def change
    add_column :male_betta, :color, :string
    add_column :male_betta, :tail, :string
    add_column :male_betta, :pattern, :string
    add_column :male_betta, :price, :float
  end
end
