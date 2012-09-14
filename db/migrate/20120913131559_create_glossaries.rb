class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
