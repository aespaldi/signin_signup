class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.string :long
      t.string :short
      t.integer :counter, default: 0

      # t.timestamps
    end
  end
end
