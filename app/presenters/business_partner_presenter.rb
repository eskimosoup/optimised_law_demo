class BusinessPartnerPresenter < BasePresenter
  presents :business_partner

  delegate :name, to: :business_partner

  def show
    if business_partner.link
      h.link_to show_image(alt: name), business_partner.link, title: name
    else
      show_image(alt: name)
    end
  end
end
