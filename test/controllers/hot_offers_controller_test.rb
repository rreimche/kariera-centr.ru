require 'test_helper'

class HotOffersControllerTest < ActionController::TestCase
  setup do
    @hot_offer = hot_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hot_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hot_offer" do
    assert_difference('HotOffer.count') do
      post :create, hot_offer: { content: @hot_offer.content, end_date: @hot_offer.end_date, start_date: @hot_offer.start_date }
    end

    assert_redirected_to hot_offer_path(assigns(:hot_offer))
  end

  test "should show hot_offer" do
    get :show, id: @hot_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hot_offer
    assert_response :success
  end

  test "should update hot_offer" do
    patch :update, id: @hot_offer, hot_offer: { content: @hot_offer.content, end_date: @hot_offer.end_date, start_date: @hot_offer.start_date }
    assert_redirected_to hot_offer_path(assigns(:hot_offer))
  end

  test "should destroy hot_offer" do
    assert_difference('HotOffer.count', -1) do
      delete :destroy, id: @hot_offer
    end

    assert_redirected_to hot_offers_path
  end
end
