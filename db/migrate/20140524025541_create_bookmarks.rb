class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :url
      t.text :description

      t.timestamps
    end
  end
end
