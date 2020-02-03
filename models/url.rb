# frozen_string_literal: true

class Url < ActiveRecord::Base
  validates :original_url, length: { maximum: 4_294_967_296 },
                           presence: true,
                           allow_blank: false

  validates :original_url, format: { with: URI.regexp(%w[http https]),
                                     message: 'not valid' }

  after_create :generate_short_url

  def generate_short_url
    self.short_url = (50_000_000_000. + id).to_s(36)
    save!
  end
end
