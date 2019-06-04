class ShortLink < ApplicationRecord
  validates :original_url, presence: true
  validates :view_count, presence: true
  validates :shortened_url_key, presence: true
  validates_uniqueness_of :shortened_url_key

  def self.create_shortened_url_key
    possible_values = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten

    shortened_url_key = (0...8).map do
      possible_values[rand(possible_values.size)]
    end

    shortened_url_key.join
  end
end
