require 'test_helper'
# Test for link mutations
class Mutations::CreateVoteTest < ActiveSupport::TestCase
  def login_perform(**args)
    Mutations::SignInUser.new(object: nil, context: { session: {} }).resolve(args)
  end

  def perform(user: @result[:user], **args)
    Mutations::CreateVote.new(object: nil, context: { session: user, current_user: user}).resolve(args)
  end

  def create_link
    @link = Link.create!(
      url: 'http://google.com',
      description: 'Google Platform',
    )
  end

  def create_user
    User.create!(
      name: 'Test User',
      email: 'test@user.com',
      password: '12345'
    )
  end

  def successfuly_login_user
    @user = create_user
    @result = login_perform(
      email: {
        email: 'test@user.com',
        password: @user.password
      }
    )
    @token = @result[:token]
  end

  test 'create a new vote' do
    create_link
    successfuly_login_user

    vote = perform(
        link_id: @link.id
      )

    assert vote.persisted?
  end
end
