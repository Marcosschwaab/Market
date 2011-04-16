class Product < ActiveRecord::Base
    has_many :product_offers, :dependent => :destroy
    belongs_to :unit
    belongs_to :gender
end
