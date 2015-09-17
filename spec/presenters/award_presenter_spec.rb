require "rails_helper"

RSpec.describe AwardPresenter, type: :presenter do
  describe "awards" do
    let(:award) { build(:award) }
    subject(:award_presenter) { AwardPresenter.new(object: award, view_template: view)}

    it "returns the image" do
      expect(award_presenter.show_image(alt: award.name)).to eq(image_tag(award.image.show, alt: award.name))
    end

    it "returns the unlined image" do
      expect(award_presenter.show).to eq(image_tag(award.image.show, alt: award.name))
    end

    describe "links" do
      let(:award) { build(:award_with_link) }
      subject(:article_presenter) { AwardPresenter.new(object: award, view_template: view)}

      it "returns the award with linked image" do
        expect(award_presenter.show).to eq(link_to (image_tag(award.image.show, alt: award.name)), award.link, title: award.name)
      end
    end
  end
end
