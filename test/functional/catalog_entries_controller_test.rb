require 'test_helper'

class CatalogEntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalog_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalog_entry" do
    assert_difference('CatalogEntry.count') do
      post :create, :catalog_entry => { }
    end

    assert_redirected_to catalog_entry_path(assigns(:catalog_entry))
  end

  test "should show catalog_entry" do
    get :show, :id => catalog_entries(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => catalog_entries(:one).id
    assert_response :success
  end

  test "should update catalog_entry" do
    put :update, :id => catalog_entries(:one).id, :catalog_entry => { }
    assert_redirected_to catalog_entry_path(assigns(:catalog_entry))
  end

  test "should destroy catalog_entry" do
    assert_difference('CatalogEntry.count', -1) do
      delete :destroy, :id => catalog_entries(:one).id
    end

    assert_redirected_to catalog_entries_path
  end
end
