require 'test_helper'

class CourseUnitsControllerTest < ActionController::TestCase
  setup do
    @course_unit = course_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_unit" do
    assert_difference('CourseUnit.count') do
      post :create, course_unit: { description: @course_unit.description, note: @course_unit.note, title: @course_unit.title }
    end

    assert_redirected_to course_unit_path(assigns(:course_unit))
  end

  test "should show course_unit" do
    get :show, id: @course_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_unit
    assert_response :success
  end

  test "should update course_unit" do
    patch :update, id: @course_unit, course_unit: { description: @course_unit.description, note: @course_unit.note, title: @course_unit.title }
    assert_redirected_to course_unit_path(assigns(:course_unit))
  end

  test "should destroy course_unit" do
    assert_difference('CourseUnit.count', -1) do
      delete :destroy, id: @course_unit
    end

    assert_redirected_to course_units_path
  end
end
