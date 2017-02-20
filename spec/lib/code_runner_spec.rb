# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CodeRunner do
  let!(:board1) { create(:board, mac: "1234") }
  let!(:board2) { create(:board, mac: "5678") }
  let(:run_double) { instance_double("Toggle", run: true) }

  subject { CodeRunner }

  describe "run" do
    before do
      allow(Toggle).to receive(:new).and_return(run_double)
    end

    it "notifies one board" do
      create_sketch logic: "toggle"

      subject.execute_flow board1

      expect(Toggle).to have_received(:new).with(board2.mac)
    end

    it "raises an error if there's no active sketch" do
      create_sketch status: "closed"

      expect {
        subject.execute_flow board1
      }.to raise_error "Couldn't find active sketch for #{board1.mac}"
    end
  end

  private

  def create_sketch params = {}
    create(:sketch, boards: boards(params), links: links(params), status: params.fetch(:status, "active"))
  end

  def boards params = {}
    [
      {
        mac: board1.mac
      },
      {
        mac: board2.mac
      }
    ]
  end

  def links params = {}
    [
      {
        from: board1.mac,
        to: board2.mac,
        logic: params.fetch(:logic, "toggle")
      }
    ]
  end
end
