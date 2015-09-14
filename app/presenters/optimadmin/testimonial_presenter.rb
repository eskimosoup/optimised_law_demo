module Optimadmin
  class TestimonialPresenter < Optimadmin::BasePresenter
    presents :testimonial

    def id
      testimonial.id
    end

    def title
      #testimonial.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.raw testimonial.summary
    end
  end
end
