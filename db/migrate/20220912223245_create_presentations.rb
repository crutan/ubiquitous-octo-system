class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :viewing, default: false
      t.integer :viewing_slide_id

      t.timestamps
    end
    
  end
end
