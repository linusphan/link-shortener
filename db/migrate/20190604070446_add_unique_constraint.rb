class AddUniqueConstraint < ActiveRecord::Migration[5.2]
  def change
    add_index :short_links, :shortened_url_key, unique: true
  end
end
