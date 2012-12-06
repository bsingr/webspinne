require 'spec_helper'

describe Webspinne::Index do
  subject { described_class.new }

  its(:size) { should == 0}
  its(:visited_size) { should == 0}

  context 'with onsite-link' do
    before { subject << Webspinne::Link.new('foo', true) }

    its(:size) { should == 1 }
    its(:next_unvisited_onsite_link) { should be_instance_of(Webspinne::Link) }
  
    context 'and the same link again' do
      before { subject << Webspinne::Link.new('foo', true) }
      its(:size) { should == 1 }
    end

    context 'and another link' do
      before { subject << Webspinne::Link.new('bar', true) }
      its(:size) { should == 2 }
    end

    context 'visited' do
      before { subject.next_unvisited_onsite_link.visited! }
      its(:visited_size) { should == 1 }
    end
  end

  context 'with offsite-link' do
    before { subject << Webspinne::Link.new('foo', false) }

    its(:size) { should == 1 }
    its(:next_unvisited_onsite_link) { should be_nil }
  end

end
