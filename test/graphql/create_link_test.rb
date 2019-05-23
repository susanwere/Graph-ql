# frozen_string_literal: true

require 'test_helper'

print("finally got here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
# Test for link mutations
class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  def create_link
    perform(
      url: 'http://google.com',
      description: 'Google Platform'
    )
  end

  def create_link_with_invalid_url
    perform(
      url: 'http',
      description: 'Google Platform'
    )
  end

  def create_link_with_invalid_description
    perform(
      url: 'http://google.com',
      description: 'Goo'
    )
  end

  test 'create a new link' do
    link = create_link

    assert link.persisted?
    assert_equal link.url, 'http://google.com'
    assert_equal link.description, 'Google Platform'
  end

  test 'cannot create a duplicate link' do
    link = create_link
    new_link = create_link

    assert_equal new_link.message, "Invalid input: Url has already been taken"
  end

  test 'Link should be more than 5 characters' do
    link = create_link_with_invalid_url

    assert_equal link.message, "Invalid input: Url is too short (minimum is 5 characters)"
  end

  test 'Description should be more than 5 characters' do
    link = create_link_with_invalid_description

    assert_equal link.message, "Invalid input: Description is too short (minimum is 5 characters)"
  end
end
