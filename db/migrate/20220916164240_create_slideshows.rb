# frozen_string_literal: true

class CreateSlideshows < ActiveRecord::Migration[7.0]
  def change
    create_table :slideshows do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
