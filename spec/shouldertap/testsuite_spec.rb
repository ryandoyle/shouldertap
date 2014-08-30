require 'spec_helper'

require 'shouldertap/testsuite'

describe ShoulderTap::Testsuite do


  let(:failing_output) { "1..4\n" +
                        "ok 1 testing foo bats\n" +
                        "not ok 2 the exit code: defaults to 0\n" +
                        "# (in test file /home/ryan/code/stubish/stub.bats, line 12)\n" +
                        "ok 3 stubbing a command to give an exit code of 1 returns 1 when the stub is called\n" +
                        "ok 4 stubbing returns an error when the stubbing arguments do not match\n"
                      }
  let(:successful_output) { "1..3\n" +
                        "ok 1 testing foo bats\n" +
                        "ok 2 stubbing a command to give an exit code of 1 returns 1 when the stub is called\n" +
                        "ok 3 stubbing returns an error when the stubbing arguments do not match\n"
                      }
  let(:nothing_output) { "someoutput that has no tests" }

  let(:successful_test) { ShoulderTap::Testsuite.new successful_output }
  let(:failing_test)    { ShoulderTap::Testsuite.new failing_output    }
  let(:nothing_test)    { ShoulderTap::Testsuite.new nothing_output }

  describe '#success?' do

    it 'is true if all the tests passed' do 
      expect(successful_test.success?).to eql true
    end

    it 'is false if any tests failed' do
      expect(failing_test.success?).to eql false
    end

    it 'is true if there are no tests' do
      expect(nothing_test.success?).to eql true
    end

  end

  describe '#size' do
    it 'is a count of the number of tests that ran' do
      expect(failing_test.size).to eql 4
    end
  end

  describe '#failed_count' do
    it 'is the number of failed tests' do
      expect(failing_test.failed_count).to eql 1
    end
  end

  describe '#success_count' do
    it 'is the number of successful tests' do
      expect(failing_test.success_count).to eql 3
    end
  end


end


