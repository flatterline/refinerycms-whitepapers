class CreateWhitepaperPages < ActiveRecord::Migration

  def up
    create_table :refinery_whitepaper_pages do |t|
      t.belongs_to :page
      t.belongs_to :resource
      t.string     :page_type, default: 'Refinery::Page'
    end

    add_index :refinery_whitepaper_pages, :page_id
    add_index :refinery_whitepaper_pages, :resource_id
  end

  def down
    drop_table :refinery_whitepaper_pages
  end

end
