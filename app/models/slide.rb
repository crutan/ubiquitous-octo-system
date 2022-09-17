class Slide < ApplicationRecord
  belongs_to :slideshow
  acts_as_list scope: :slideshow
  has_rich_text :body

end
