# frozen_string_literal: true

class AddPresentationColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :presentations, :name, :string, null: false
    add_reference :presentations, :user
    add_reference :presentations, :slide
  end
end
