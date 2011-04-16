class Admin::ProductOffersController < ApplicationController
    layout 'admin'
    
    before_filter :authenticate

    def authenticate
      authenticate_or_request_with_http_basic do |name, pass|
        #User.authenticate(name, pass)
        name == 'admin' && pass == 'mercado'      
      end
    end
    

    before_filter :load_products, :only=>[:new, :edit, :create, :update]

    # GET /product_offers
    # GET /product_offers.xml
    def index
      @product_offers = ProductOffer.all.group_by(&:product_id).map { |k,v| v.min_by(&:price) }
    

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @product_offers }
      end
    end

    # GET /product_offers/1
    # GET /product_offers/1.xml
    def show
      @product_offer = ProductOffer.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product_offer }
      end
    end

end

