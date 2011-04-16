class CreateProductOffers < ActiveRecord::Migration
  def self.up
    create_table :product_offers do |t|
      t.integer :product_id
      t.decimal :price, :precision => 8, :scale => 2, :default => 0.00
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_offers
  end
end
