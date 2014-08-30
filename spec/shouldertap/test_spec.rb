require 'spec_helper'

require 'shouldertap/test'

describe ShoulderTap::Test do 

  let(:test) { described_class.new 'ok 3 testing foo bats' }

  describe '#success?' do

    let(:failing_test) { described_class.new "not ok 2 true should equal false" }

    it 'is true for a successful test' do
      expect(test.success?).to eql true
    end

    it 'is false for a failed test' do
      expect(failing_test.success?).to eql false 
    end
    
  end


  describe '#number' do
    it 'is the number of the test' do
      expect(test.number).to eql 3
    end
  end

  describe 'message' do
    it 'is the extra message that goes with the test' do
      expect(test.message).to eql 'testing foo bats'
    end
  end
  


end


