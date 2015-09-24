require 'rails_helper'

RSpec.describe ServiceDownload, type: :model do
  describe "validations", :validation do
    it { should belong_to(:service) }
    it { should belong_to(:download) }
  end
end
