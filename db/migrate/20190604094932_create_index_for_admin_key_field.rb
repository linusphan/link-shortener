class CreateIndexForAdminKeyField < ActiveRecord::Migration[5.2]
  def change
    create_table :index_for_admin_key_fields do |t|
      add_index :short_links, :admin_url_key, unique: true
    end
  end
end
