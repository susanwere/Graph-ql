# frozen_string_literal: true

module Types
  # Define vote type
  class VoteType < BaseObject
    field :id, ID, null: false
    field :user, UserType, null: false
    field :link, LinkType, null: true
  end
end
