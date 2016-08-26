class CreatePersonTags < ActiveRecord::Migration[5.0]
  def change
    create_table :person_tags do |t|
      t.string  :tag_name,               limit: 16
      t.string  :tag_type,               limit: 16
      t.integer :person_id
      t.boolean :disabled, default: false

      t.timestamps
    end
  add_index :person_tags, :tag_name
  add_index :person_tags, :tag_type
  add_index :person_tags, :person_id
  add_index :person_tags, :disabled
  end
end
