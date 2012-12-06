require 'spec_helper'

describe Webspinne::Site do
  subject { described_class.new 'http://foobar.com' }

  it 'returns hostname' do
    subject.hostname.should == 'foobar.com'
    subject.hostname('http://www.foobar.com').should == 'www.foobar.com'
    subject.hostname('http://baccio.com').should == 'baccio.com'
    subject.hostname('lalal').should == nil
  end

  shared_examples_for 'onsite' do |uri|
    specify { subject.onsite?(uri).should be_true }
    specify { subject.offsite?(uri).should be_false }
  end

  shared_examples_for 'offsite' do |uri|
    specify { subject.onsite?(uri).should be_false }
    specify { subject.offsite?(uri).should be_true }
  end

  # onsite
  %w[ http://foobar.com
      http://foobar.com/
      http://foobar.com/x ].each do |uri|
    context uri do
      it_behaves_like 'onsite', uri
    end
  end

  # offsite
  %w[ http://baccio.com
      http://subdomain.foobar.com ].each do |uri|
    context uri do
      it_behaves_like 'offsite', uri
    end
  end
end