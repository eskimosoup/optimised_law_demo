require 'rails_helper'

RSpec.describe TeamMember::Testimonial, type: :model do
  describe "associations", :association do
    it { should belong_to(:team_member) }
    it { should belong_to(:testimonial) }
  end
end
