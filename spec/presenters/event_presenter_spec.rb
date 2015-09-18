require "rails_helper"

RSpec.describe EventPresenter, type: :presenter do
  describe "standard event" do
    let(:event) { build(:event) }
    subject(:event_presenter) { EventPresenter.new(object: event, view_template: view)}

    it "returns the title" do
      expect(event_presenter.title).to eq(event.title)
    end

    it "returns the summary" do
      expect(event_presenter.summary).to eq(raw event.summary)
    end

    describe "date formatting" do
      it "should return the date with default format" do
        expect(event_presenter.start_date).to eq(l event.start_date_time.to_date, format: :day_month)
      end

      it "should return the day" do
        expect(event_presenter.start_day).to eq(l event.start_date_time.to_date, format: :day)
      end

      it "should return the month" do
        expect(event_presenter.start_month).to eq(l event.start_date_time.to_date, format: :month)
      end
    end
  end

  describe "images" do
    describe "no image" do
      let(:event) { build(:event) }
      subject(:event_presenter) { EventPresenter.new(object: event, view_template: view)}
      it "index_image should return nil" do
        expect(event_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(event_presenter.show_image).to eq(nil)
      end

      it "activity_stream_image should return nil" do
        expect(event_presenter.activity_stream_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:event) { build(:event_with_image) }
      subject(:event_presenter) { EventPresenter.new(object: event, view_template: view)}
      it "index_image should return nil" do
        expect(event_presenter.index_image(alt: event.title)).to eq(image_tag(event.image.index, alt: event.title))
      end

      it "show_image should return nil" do
        expect(event_presenter.show_image(alt: event.title)).to eq(image_tag(event.image.show, alt: event.title))
      end
    end
  end
end
