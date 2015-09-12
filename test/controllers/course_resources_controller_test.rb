require 'test_helper'

class CourseResourcesControllerTest < ActionController::TestCase
  setup do
    @course_resource = course_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_resource" do
    assert_difference('CourseResource.count') do
      post :create, course_resource: { content: @course_resource.content, kind_id: @course_resource.kind_id, kind_id: @course_resource.kind_id, note: @course_resource.note, resource_file: @course_resource.resource_file, title: @course_resource.title }
    end

    assert_redirected_to course_resource_path(assigns(:course_resource))
  end

  test "should show course_resource" do
    get :show, id: @course_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_resource
    assert_response :success
  end

  test "should update course_resource" do
    patch :update, id: @course_resource, course_resource: { content: @course_resource.content, kind_id: @course_resource.kind_id, kind_id: @course_resource.kind_id, note: @course_resource.note, resource_file: @course_resource.resource_file, title: @course_resource.title }
    assert_redirected_to course_resource_path(assigns(:course_resource))
  end

  test "should destroy course_resource" do
    assert_difference('CourseResource.count', -1) do
      delete :destroy, id: @course_resource
    end

    assert_redirected_to course_resources_path
  end
end
