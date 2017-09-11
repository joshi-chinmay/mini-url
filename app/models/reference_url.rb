class ReferenceUrl < ApplicationRecord

  after_initialize :set_defaults, unless: :persisted?

  validates :mini_url, :associated_url, :in_use, presence: true
  validates :mini_url, uniqueness: true
  validates :associated_url, :format => URI::regexp(%w(http https))

  def set_defaults
    self.in_use ||= true
  end

  def generate_random_mini_url
    (0...16).map{97.+(rand(25)).chr.downcase}.join
  end

end
