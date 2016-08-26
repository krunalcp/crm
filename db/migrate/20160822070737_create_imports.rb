class CreateImports < ActiveRecord::Migration[5.0]
  def change
    create_table     :imports do |t|
      t.integer      :user_id
      t.string       :upload_file_name
      t.integer      :number_of_success
      t.integer      :number_of_failed
      t.integer      :total_record
      t.text         :failure_reason
      t.string       :status,                  limit: 1
      t.boolean      :disabled, default: false
      
      t.timestamps
    end
    add_index :imports, :user_id
    add_index :imports, :number_of_success
    add_index :imports, :number_of_failed
    add_index :imports, :total_record
    add_index :imports, :disabled
  end
end
