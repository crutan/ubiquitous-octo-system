class SlideshowsBelongToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference(:slideshows, :user, foreign_key: true)
  end
end
