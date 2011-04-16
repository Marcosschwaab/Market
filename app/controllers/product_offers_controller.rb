class ProductOffersController < ApplicationController
  before_filter :authenticate_user!
  
  before_filter :load_products, :only=>[:new, :edit, :create, :update]
  
  # GET /product_offers
  # GET /product_offers.xml
  def index
    @product_offers = ProductOffer.all
    @products = Product.all
    
  
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

  # GET /product_offers/new
  # GET /product_offers/new.xml
  def new
    @product_offer = ProductOffer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_offer }
    end
  end

  # GET /product_offers/1/edit
  def edit
    @product_offer = ProductOffer.find(params[:id])
  end

  # POST /product_offers
  # POST /product_offers.xml
  def create
    @product_offer = ProductOffer.new(params[:product_offer])

    respond_to do |format|
      if @product_offer.save
        format.html { redirect_to(@product_offer, :notice => 'Product offer was successfully created.') }
        format.xml  { render :xml => @product_offer, :status => :created, :location => @product_offer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_offers/1
  # PUT /product_offers/1.xml
  def update
    @product_offer = ProductOffer.find(params[:id])

    respond_to do |format|
      if @product_offer.update_attributes(params[:product_offer])
        format.html { redirect_to(@product_offer, :notice => 'Product offer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_offers/1
  # DELETE /product_offers/1.xml
  def destroy
    @product_offer = ProductOffer.find(params[:id])
    @product_offer.destroy

    respond_to do |format|
      format.html { redirect_to(product_offers_url) }
      format.xml  { head :ok }
    end
  end
  
   private
    def load_products
      @products = Product.all.collect {|c| ["#{c.name} - #{c.description}", c.id] }
    end
  end

