require 'test_helper'

class ClasstimetablesControllerTest < ActionController::TestCase
  setup do
    @classtimetable = classtimetables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classtimetables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classtimetable" do
    assert_difference('Classtimetable.count') do
      post :create, classtimetable: { day: @classtimetable.day, end_time: @classtimetable.end_time, month: @classtimetable.month, start_time: @classtimetable.start_time, weekday: @classtimetable.weekday, year: @classtimetable.year }
    end

    assert_redirected_to classtimetable_path(assigns(:classtimetable))
  end

  test "should show classtimetable" do
    get :show, id: @classtimetable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classtimetable
    assert_response :success
  end

  test "should update classtimetable" do
    patch :update, id: @classtimetable, classtimetable: { day: @classtimetable.day, end_time: @classtimetable.end_time, month: @classtimetable.month, start_time: @classtimetable.start_time, weekday: @classtimetable.weekday, year: @classtimetable.year }
    assert_redirected_to classtimetable_path(assigns(:classtimetable))
  end

  test "should destroy classtimetable" do
    assert_difference('Classtimetable.count', -1) do
      delete :destroy, id: @classtimetable
    end

    assert_redirected_to classtimetables_path
  end
end
