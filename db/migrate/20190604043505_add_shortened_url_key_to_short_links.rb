class AddShortenedUrlKeyToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :shortened_url_key, :string, limit: 16
  end
end
