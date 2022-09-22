# frozen_string_literal: true

class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.references :slideshow, foreign_key: true

      t.timestamps
    end
  end
end
