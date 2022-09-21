class CreateAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true, null: true
      t.references :presentation, foreign_key: true, null: false
      t.string :name, null: false
      t.boolean :presenter, default: false

      t.timestamps
    end
  end
end
