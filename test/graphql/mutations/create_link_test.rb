# frozen_string_literal: true

require 'test_helper'
# Test for link mutations
class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    link = perform(
      url: 'http://google.com',
      description: 'Google Platform'
    )

    assert link.persisted?
    assert_equal link.url, 'http://google.com'
    assert_equal link.description, 'Google Platform'
  end
end
