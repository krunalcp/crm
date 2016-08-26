class CreatePersonEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :person_emails do |t|
      t.string   :email,                   limit: 62
      t.string   :email_type
      t.integer  :person_id
      t.boolean  :disabled, default: false

      t.timestamps
    end
  add_index :person_emails, :email
  add_index :person_emails, :person_id
  add_index :person_emails, :disabled
  end
end
