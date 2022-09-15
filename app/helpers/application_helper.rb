module ApplicationHelper
  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
  end

  def previous_slide(slide)
    slide.higher_item.nil? ? slide : slide.higher_item
  end

  def next_slide(slide)
    slide.lower_item.nil? ? slide : slide.lower_item
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end
end
