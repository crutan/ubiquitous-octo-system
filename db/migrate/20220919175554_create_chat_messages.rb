class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :attendee, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
