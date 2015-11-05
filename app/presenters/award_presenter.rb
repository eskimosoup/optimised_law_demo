class AwardPresenter < BasePresenter
  presents :award

  delegate :name, to: :award

  def show
    if award.link.present?
      h.link_to show_image(alt: name), award.link, title: name
    else
      show_image(alt: name)
    end
  end
end
