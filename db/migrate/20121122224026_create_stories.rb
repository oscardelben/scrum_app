class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :points
      t.string :state

      t.timestamps
    end
  end
end
