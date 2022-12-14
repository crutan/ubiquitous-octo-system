# frozen_string_literal: true

class CreateSlides < ActiveRecord::Migration[7.0]
  def change
    create_table :slides do |t|
      t.string :name, null: false
      t.references :slideshow, null: false, foreign_key: true
      t.integer :position, default: 0, null: false
      t.text :notes

      t.timestamps
    end
  end
end
