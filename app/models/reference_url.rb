class ReferenceUrl < ApplicationRecord

  validates :mini_url, :associated_url, :in_use, presence: true
end
