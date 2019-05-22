# frozen_string_literal: true

class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :user, optional: true

  has_many :votes
end
