require 'spec_helper'

describe Webspinne do
  it 'visits a site' do
    VCR.use_cassette('localhost') do
      visit = described_class.visit 'http://localhost:4567', 5
      visit.index.size.should           == 21   # links
      visit.index.visited_size.should   == 5    # visitied_links
      visit.index.unvisited_size.should == 16   # unvisited links
      visit.index.onsite_size.should    == 19   # onsite links
      visit.index.offsite_size.should   == 2    # offsite links
    end
  end
end
