class CreateSlides < ActiveRecord::Migration[7.0]
  def change
    create_table :slides do |t|
      t.string :name, null: false
      t.references :presentation, null: false, foreign_key: true
      t.integer :position, default: 0, null: false
      t.text :body

      t.timestamps
    end
    add_foreign_key :presentations, :slides, column: :viewing_slide_id

  end
end
