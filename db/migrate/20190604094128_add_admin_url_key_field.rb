class AddAdminUrlKeyField < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :admin_url_key, :string, null: false, unique: true
  end
end
