class ProductOffer < ActiveRecord::Base
    validates_uniqueness_of :product_id, :scope => :user_id
    validates_presence_of :product_id
    validates_presence_of :price
    belongs_to :product
    belongs_to :user
    
end
