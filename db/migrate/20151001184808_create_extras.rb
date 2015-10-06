class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
    	t.text :title
    	t.text :text
      t.timestamps
    end
  end
end
