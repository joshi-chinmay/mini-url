class ReferenceUrl < ApplicationRecord

  CHARSET_MAP = (48..57).map(&:chr) + (65..90).map(&:chr) + (97..122).map(&:chr)

  after_initialize :set_defaults, unless: :persisted?

  validates :mini_url, :associated_url, presence: true
  validates :mini_url, uniqueness: true
  validates :associated_url, :format => URI::regexp(%w(http https))

  def set_defaults
    self.mini_url ||= self.generate_random_mini_url

    # always have a uniq miin url
    loop do
      break if ReferenceUrl.where(mini_url: self.mini_url).count == 0
      self.mini_url = self.generate_random_mini_url
    end
  end

  def generate_random_mini_url
    (0..9).map { CHARSET_MAP[rand(CHARSET_MAP.count)] }.join
  end

end
