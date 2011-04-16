require 'test_helper'

class ProductOffersControllerTest < ActionController::TestCase
  setup do
    @product_offer = product_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_offer" do
    assert_difference('ProductOffer.count') do
      post :create, :product_offer => @product_offer.attributes
    end

    assert_redirected_to product_offer_path(assigns(:product_offer))
  end

  test "should show product_offer" do
    get :show, :id => @product_offer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_offer.to_param
    assert_response :success
  end

  test "should update product_offer" do
    put :update, :id => @product_offer.to_param, :product_offer => @product_offer.attributes
    assert_redirected_to product_offer_path(assigns(:product_offer))
  end

  test "should destroy product_offer" do
    assert_difference('ProductOffer.count', -1) do
      delete :destroy, :id => @product_offer.to_param
    end

    assert_redirected_to product_offers_path
  end
end
