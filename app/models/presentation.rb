class Presentation < ApplicationRecord
  has_many :slides, -> {order(position: :asc)}
  belongs_to :viewing_slide, class_name: 'Slide', optional: true
  
  def current_slide
    return slides.first unless viewing_slide

    viewing_slide
  end
  
  def previous_slide
    return current_slide if current_slide.first?
    return current_slide.higher_item
  end

  def next_slide
    return current_slide if current_slide.last?
    return current_slide.lower_item
  end
end
