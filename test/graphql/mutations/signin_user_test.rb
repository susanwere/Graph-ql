require 'test_helper'
# Test for link mutations
class Mutations::SignInUserTest < ActiveSupport::TestCase

  def perform(args = {})
    Mutations::SignInUser.new(object: nil, context: { session: {} }).resolve(args)
  end

  def create_user
    @user = User.create!(
      name: 'Test User',
      email: 'test@user.com',
      password: '12345'
    )
  end

  def successfuly_login_user
    @result = perform(
      email: {
        email: @user.email,
        password: @user.password
      }
    )
  end

  def unsuccessfuly_login_user
    @failure_response = perform(
      email: {
        email: 'wrong email', 
        password: 'wrong password'
      }
    )
  end

  test 'successful sign in' do
    create_user
    successfuly_login_user
    assert @result[:token].present?
    assert_equal @result[:user], @user
  end

  test 'unsucceessful login due to missing credentials' do
    create_user
    assert_nil perform
  end

  test 'unsucceessful login due to wrong email and password' do
    create_user
    assert_nil @failure_response
  end
end
