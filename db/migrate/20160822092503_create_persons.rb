class CreatePersons < ActiveRecord::Migration[5.0]
  def change
    create_table :persons do |t|
      t.string   :prefix_name,            limit: 8
      t.string   :first_name,             limit: 64
      t.string   :middle_name,            limit: 1
      t.string   :last_name,              limit: 64
      t.string   :suffix_name,            limit: 8
      t.integer  :user_id
      t.text     :address1
      t.text     :address2
      t.string   :city,                    limit: 64
      t.string   :state,                   limit: 2
      t.string   :zip1,                    limit: 4
      t.string   :zip2,                    limit: 5
      t.string   :gender,                  limit: 1
      t.integer  :unsubscribe,             limit: 1
      t.boolean  :disabled, default: false

      t.timestamps
    end
    add_index :persons, :first_name
    add_index :persons, :user_id
    add_index :persons, :disabled
  end
end
