# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CodeRunner do
  let!(:source_data) { create(:board, mac: "1234", metadata: {title: 'Hello world'}) }
  let!(:button) { create(:board, mac: "5678") }
  let!(:led) { create(:board, mac: 'abcd') }
  let!(:preipheral) { create(:board, mac: 'efgh') }
  let(:run_toggle_double) { instance_double("Toggle", run: true) }
  let(:run_sync_double) { instance_double("SyncData", run: true) }
  let(:run_link_opener_double) { instance_double("LinkOpener", run: true) }

  subject { CodeRunner }

  describe "run" do
    before do
      allow(Toggle).to receive(:new).and_return(run_toggle_double)
      allow(SyncData).to receive(:new).and_return(run_sync_double)
      allow(LinkOpener).to receive(:new).and_return(run_link_opener_double)
    end

    it "notifies one board" do
      create_sketch

      subject.execute_flow button

      expect(Toggle).to have_received(:new).with(led.mac)

    end

    it 'notifies all boards' do
      create_sketch

      subject.execute_flow button

      expect(Toggle).to have_received(:new).with(led.mac)
      expect(SyncData).to have_received(:new).with(source_data.mac)
      expect(LinkOpener).to have_received(:new).with(preipheral.mac)
    end

    it "raises an error if there's no active sketch" do
      create_sketch status: "closed"

      expect {
        subject.execute_flow button
      }.to raise_error "Couldn't find active sketch for #{button.mac}"
    end
  end

  private


  # create sketch with 4 boards
  # first board is a source_data
  # second board is a button
  # third board is an LED
  # fourth board is a peripheral ( laptop )
  def create_sketch params = {}
    create(:sketch, boards: boards(params), links: links(params), status: params.fetch(:status, "active"))
  end

  def boards params = {}
    [
      {
        mac: source_data.mac
      },
      {
        mac: button.mac
      },
      {
        mac: led.mac
      },
      {
        mac: preipheral.mac
      }
    ]
  end

  def links params = {}
    [
      {
        from: source_data.mac,
        to: button.mac,
        logic: 'sync_data'
      },
      {
        from: button.mac,
        to: led.mac,
        logic: 'toggle'
      },
      {
        from: button.mac,
        to: preipheral.mac,
        logic: 'link_opener'
      }
    ]
  end
end
