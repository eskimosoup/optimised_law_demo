module Optimadmin
  class BusinessPartnerPresenter < Optimadmin::BasePresenter
    presents :business_partner
    delegate :name, to: :business_partner

    def id
      business_partner.id
    end
  end
end
