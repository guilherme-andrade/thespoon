class AddImageUrlToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :image_url, :string
  end
end
