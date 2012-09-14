class CreateGlossariesWords < ActiveRecord::Migration
  def change 
    create_table :glossaries_words, :id => false do |t|
      t.integer :word_id
      t.integer :glossary_id
    end
  end
end
