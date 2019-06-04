class AddNotNullConstraintToShortLinksTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :short_links, :shortened_url_key, false
  end
end
