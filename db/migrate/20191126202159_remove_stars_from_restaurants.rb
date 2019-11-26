class RemoveStarsFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :stars, :integer
  end
end
