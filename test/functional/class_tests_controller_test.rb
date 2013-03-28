require 'test_helper'

class ClassTestsControllerTest < ActionController::TestCase
  setup do
    @class_test = class_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_test" do
    assert_difference('ClassTest.count') do
      post :create, class_test: {  }
    end

    assert_redirected_to class_test_path(assigns(:class_test))
  end

  test "should show class_test" do
    get :show, id: @class_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_test
    assert_response :success
  end

  test "should update class_test" do
    put :update, id: @class_test, class_test: {  }
    assert_redirected_to class_test_path(assigns(:class_test))
  end

  test "should destroy class_test" do
    assert_difference('ClassTest.count', -1) do
      delete :destroy, id: @class_test
    end

    assert_redirected_to class_tests_path
  end
end
