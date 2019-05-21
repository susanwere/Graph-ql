class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :user
end
