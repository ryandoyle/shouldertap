require 'spec_helper'

require 'shouldertap/notification'

describe ShoulderTap::Notification do


  let(:test_suite) { double('test_suite') }
  let(:notification) { described_class.new test_suite  }


  describe '#title' do
    it 'is a successful message if there were no failures' do
      allow(test_suite).to receive(:success?).and_return true
      expect(notification.title).to eql 'ShoulderTap - Passed'
    end
    it 'is a failing message if there were failures' do
      allow(test_suite).to receive(:success?).and_return false
      expect(notification.title).to eql 'ShoulderTap - Failed'
    end
  end

  describe '#message' do
    it 'displays the amount of successful tests' do
      allow(test_suite).to receive(:success_count).and_return 3
      allow(test_suite).to receive(:size).and_return 6
      expect(notification.message).to eql '3/6 tests passed'
    end
  end
  
  describe '#icon' do

    before do
      allow(File).to receive(:dirname).and_return '/dir'
    end

    it 'is the success icon when the testsuite is successful' do
      allow(test_suite).to receive(:success?).and_return true
      expect(notification.icon).to eql '/dir/resources/dialog-information.png'
    end
    it 'is the error icon when the testsuite has failure' do
      allow(test_suite).to receive(:success?).and_return false
      expect(notification.icon).to eql '/dir/resources/dialog-error.png'
    end
  end

end
