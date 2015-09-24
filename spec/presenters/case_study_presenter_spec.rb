require "rails_helper"

RSpec.describe CaseStudyPresenter, type: :presenter do
  describe "standard case_study" do
    let(:case_study) { create(:case_study) }
    subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view)}

    it "returns the name" do
      expect(case_study_presenter.title).to eq(case_study.title)
    end

    it "returns the case study category" do
      expect(case_study_presenter.case_study_category).to eq(case_study.case_study_category)
    end

    it "returns the case study category name" do
      expect(case_study_presenter.case_study_category_name).to eq(case_study.case_study_category.name)
    end

    it "returns the summary" do
      expect(case_study_presenter.summary).to eq(simple_format(case_study.summary))
    end

    it "returns the content" do
      expect(case_study_presenter.content).to eq(raw(case_study.content))
    end

    it "returns the read more link" do
      expect(case_study_presenter.read_more_link).to eq(link_to 'Read more', case_study, class: 'service-content-tab-read-more')
    end

    describe "date formatting" do
      it "should return the date with default format" do
        expect(case_study_presenter.date).to eq(l case_study.date, format: :default)
      end

      it "should return the date with short format" do
        expect(case_study_presenter.date(:short)).to eq(l case_study.date, format: :short)
      end

      it "should return the date with long format" do
        expect(case_study_presenter.date(:long)).to eq(l case_study.date, format: :long)
      end
    end
  end

  describe "images" do
    describe "no image" do
      let(:case_study) { build(:case_study) }
      subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view)}
      it "index_image should return nil" do
        expect(case_study_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(case_study_presenter.show_image).to eq(nil)
      end

      it "activity_stream_image should return nil" do
        expect(case_study_presenter.activity_stream_image).to eq(nil)
      end

      it "returns the linked index image" do
        expect(case_study_presenter.linked_index_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:case_study) { create(:case_study_with_image) }
      subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view)}
      it "index_image should return nil" do
        expect(case_study_presenter.index_image(alt: case_study.title)).to eq(image_tag(case_study.image.index, alt: case_study.title))
      end

      it "show_image should return nil" do
        expect(case_study_presenter.show_image(alt: case_study.title)).to eq(image_tag(case_study.image.show, alt: case_study.title))
      end

      it "activity_stream_image should not return nil" do
        expect(case_study_presenter.activity_stream_image(alt: case_study.title)).to eq(image_tag(case_study.image.activity_stream, alt: case_study.title))
      end

      it "returns the linked index image" do
        expect(case_study_presenter.linked_index_image).to eq(link_to (image_tag case_study.image.index.url, alt: case_study.title), case_study, class: 'service-content-tab-content-item')
      end
    end
  end
end
