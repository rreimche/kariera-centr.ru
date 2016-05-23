require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get search" do
    get :search
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get test course in search results" do

  end

  test "should return empty result for a non-present course" do
  end




  test "should get new" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    get :new
    assert_response :success
  end

  test "should not get new" do
    get :new
    assert_response 401
  end


  test "should create course" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    assert_difference('Course.count') do
      post :create, course: { 
        duration: @course.duration,
        featured_image: fixture_file_upload('files/course_image.jpg', 'image/jpeg'),
        full_descr: @course.full_descr, 
        full_price: @course.full_price, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }
    end

    assert_redirected_to edit_course_path(assigns(:course))
  end

  test "should not create course" do
    post :create, course: { 
        duration: @course.duration,
        featured_image: fixture_file_upload('files/course_image.jpg', 'image/jpeg'),
        full_descr: @course.full_descr, 
        full_price: @course.full_price, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }

    assert_response 401
  end

  test "should not create course without image" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    assert_no_difference('Course.count') do
      post :create, course: { 
        duration: @course.duration,
        full_descr: @course.full_descr, 
        full_price: @course.full_price, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }
    end
  end

  test "should not create course without full_price" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    post :create, course: { 
        duration: @course.duration,
        featured_image: fixture_file_upload('files/course_image.jpg', 'image/jpeg'),
        full_descr: @course.full_descr, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should show 404 for absent course" do
    # get :show, id: "abc"
    # assert_response 404
  end

  test "should get edit" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    get :edit, id: @course
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: @course
    assert_response 401
  end

  test "should update course" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    patch :update, id: @course, course: { 
        duration: @course.duration,
        featured_image: fixture_file_upload('files/course_image.jpg', 'image/jpeg'),
        full_descr: @course.full_descr, 
        full_price: @course.full_price, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }
    assert_redirected_to edit_course_path(assigns(:course))
  end

  test "should not update course" do
    patch :update, id: @course, course: { 
        duration: @course.duration,
        featured_image: fixture_file_upload('files/course_image.jpg', 'image/jpeg'),
        full_descr: @course.full_descr, 
        full_price: @course.full_price, 
        short_descr: @course.short_descr, 
        start_date: @course.start_date, 
        timegroup: @course.timegroup, 
        title: @course.title }
    assert_response 401
  end

  test "should destroy course" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(ENV['CP_USER'] + ":" + ENV['CP_PASSWORD'])
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to root_control_path
  end

  test "should not destroy course" do
    delete :destroy, id: @course

    assert_response 401
  end
end
