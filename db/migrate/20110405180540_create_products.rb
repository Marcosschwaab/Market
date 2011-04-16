class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :mark
      t.string :code
      t.integer :unit_id
      t.integer :gender_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
