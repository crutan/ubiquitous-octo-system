# frozen_string_literal: true

class AddActiveStateToAttendeesAndPresentations < ActiveRecord::Migration[7.0]
  def change
    add_column :presentations, :active, :boolean, default: true
    add_column :attendees, :active, :boolean, default: true
  end
end
