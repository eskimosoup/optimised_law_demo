require "rails_helper"

RSpec.describe BusinessPartnerPresenter, type: :presenter do
  describe "business partners" do
    let(:business_partner) { build(:business_partner) }
    subject(:business_partner_presenter) { BusinessPartnerPresenter.new(object: business_partner, view_template: view)}

    it "returns the image" do
      expect(business_partner_presenter.show_image(alt: business_partner.name)).to eq(image_tag(business_partner.image.show, alt: business_partner.name))
    end

    it "returns the unlinked image" do
      expect(business_partner_presenter.show).to eq(image_tag(business_partner.image.show, alt: business_partner.name))
    end

    describe "links" do
      let(:business_partner) { build(:business_partner_with_link) }
      subject(:business_partner_presenter) { BusinessPartnerPresenter.new(object: business_partner, view_template: view)}

      it "returns the the linked image" do
        expect(business_partner_presenter.show).to eq(link_to (image_tag(business_partner.image.show, alt: business_partner.name)), business_partner.link, title: business_partner.name)
      end
    end
  end
end
