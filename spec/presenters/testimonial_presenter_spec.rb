require "rails_helper"

RSpec.describe TestimonialPresenter, type: :presenter do
  let(:testimonial) { build(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:author).to(:testimonial) }
    it { should delegate_method(:author_company).to(:testimonial) }
  end

  describe "standard testimonial" do
    it "should return the testimonial author" do
      expect(testimonial_presenter.author).to eq(testimonial.author)
    end

    it "should return the testimonial author company" do
      expect(testimonial_presenter.author_company).to eq(testimonial.author_company)
    end

    it "should return the html escaped recommendation" do
      expect(testimonial_presenter.recommendation).to eq(raw(testimonial.recommendation))
    end
  end

  describe "no author" do
    let(:testimonial) { build(:testimonial, author: nil) }
    subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view)}
    it "should return nil" do
      expect(testimonial_presenter.author).to eq(nil)
    end
  end

  describe "no author" do
    let(:testimonial) { build(:testimonial, author_company: nil) }
    subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view)}
    it "should return nil" do
      expect(testimonial_presenter.author_company).to eq(nil)
    end
  end
end