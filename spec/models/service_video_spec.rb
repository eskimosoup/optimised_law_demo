require 'rails_helper'

RSpec.describe ServiceVideo, type: :model do
  describe "validations", :validation do
    it { should belong_to(:service) }
    it { should belong_to(:video) }
  end
end
