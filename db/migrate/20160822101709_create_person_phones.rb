class CreatePersonPhones < ActiveRecord::Migration[5.0]
  def change
    create_table :person_phones do |t|
      t.string   :phone,                   limit: 32
      t.string   :phone_type
      t.integer  :person_id
      t.boolean  :disabled,  default: false

      t.timestamps
    end
  add_index :person_phones, :person_id
  add_index :person_phones, :disabled
  add_index :person_phones, :phone
  end
end
