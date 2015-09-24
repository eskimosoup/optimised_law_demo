require 'rails_helper'

RSpec.describe ServiceCaseStudy, type: :model do
  describe "validations", :validation do
    it { should belong_to(:service) }
    it { should belong_to(:case_study) }
  end
end
