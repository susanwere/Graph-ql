# frozen_string_literal: true

class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }

  belongs_to :user, optional: true

  has_many :votes
end
