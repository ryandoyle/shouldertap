require 'spec_helper'

require 'shouldertap/cli'

describe ShoulderTap::CLI do

  let(:options)      { ['--help', '--name', 'foops'] }
  let(:tap_output)   { "foops" }
  let(:notification) { double('notification' ) } 
  let(:testsuite)    { double('testsuite') }

  before do
    allow(ShoulderTap::Testsuite).to receive(:new).and_return testsuite
    allow(ShoulderTap::Notification).to receive(:new).and_return notification
    allow(notification).to receive(:send)
  end

  describe '#run' do
    it 'exits when --help is passed' do
      cli = new_cli_with '--help'
      allow(STDERR).to receive(:puts)
      expect(cli).to receive(:exit).with 1
      cli.run
    end
    describe '--name' do
      it 'runs shouldertap with the name if present' do
        cli = new_cli_with '--name foops'
        expect(ShoulderTap::Notification).to receive(:new).with(testsuite, 'foops')
        cli.run
      end
      it 'runs shouldertap with the default name if absent' do
        cli = new_cli_with ''
        expect(ShoulderTap::Notification).to receive(:new).with(testsuite, nil)
        cli.run
      end

    end
  end

  def new_cli_with(args)
    described_class.new(args.split(" "),tap_output)
  end


end 
