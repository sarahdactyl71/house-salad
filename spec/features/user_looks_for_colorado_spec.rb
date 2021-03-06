require 'rails_helper'

  describe PropublicaService do
    attr_reader :service

    before(:each) do
      @service = Propublica.new
    end
  end

  describe '#house_members' do
    it "sees 7 house members listed by seniority" do
      house_members = @service.house_members(state: "CO")
      house_member = house_members.first

      visit root_path
      select "Colorado", :from => "state"
      click_on "Locate Members from House"

      expect(house_members.count).to eq(7)
    end
  end

# As a user
# When I visit "/"
# And I select "Colorado" from the dropdown
# And I click on "Locate Members from the House"
# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of 7 the members of the house for Colorado
# And they should be ordered by seniority from most to least
# And I should see a name, role, party, and district for each member
