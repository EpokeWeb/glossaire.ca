class CreateCategoriesGlossaries < ActiveRecord::Migration
  def change 
    create_table :categories_glossaries, :id => false do |t|
      t.integer :category_id
      t.integer :glossary_id
    end
  end
end
