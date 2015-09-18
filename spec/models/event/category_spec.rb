require 'rails_helper'

RSpec.describe Event::Category, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:events).with_foreign_key(:event_category_id).dependent(:nullify) }
  end
end
