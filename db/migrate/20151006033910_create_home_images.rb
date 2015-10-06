class CreateHomeImages < ActiveRecord::Migration
  def change
    create_table :home_images do |t|
    	t.text :photo_url
    	t.text :link_url

      t.timestamps
    end
  end
end
