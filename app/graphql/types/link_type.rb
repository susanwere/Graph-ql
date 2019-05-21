# frozen_string_literal: true

module Types
  # defining graphql type for links
  class LinkType < BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :posted_by, UserType, null: true, method: :user
    field :votes, [Types::VoteType], null: false
  end
end
