require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
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
end
