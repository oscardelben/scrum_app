class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :points
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
