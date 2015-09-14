class TestimonialPresenter < BasePresenter
  presents :testimonial

  delegate :author, :author_company, to: :testimonial

  def recommendation
    h.raw testimonial.recommendation
  end
end
