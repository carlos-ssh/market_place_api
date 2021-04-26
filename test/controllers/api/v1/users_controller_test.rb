require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test 'should create user' do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: 'test@test.com', password: '123123' } }, as: :json
    end
    assert_response :created
  end

  test 'Should not create user with taken email' do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user.email, password: '123123' } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test 'Should update user' do
    patch api_v1_users_url(@user), params: { user: { email: @user.email, password: '123123' } }, as: :json
    assert_response :success
  end

  test 'should not update user when invalid params are sent' do
    patch api_v1_users_url(@user), params: { user: { email: 'bad_email', password: '123123' } }, as: :json
    assert_response :unprocessable_entity
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete api_v1_users_url(@user), as: :json
    end
    assert_response :no_content
  end
end
