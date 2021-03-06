# frozen_string_literal: true

require 'test_helper'
# Test for link mutations
class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new user' do
    user = perform(
      name: 'Test User',
      auth_provider: {
        email: {
          email: 'test@user.com',
          password: '12345'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Test User'
    assert_equal user.email, 'test@user.com'
  end
end
