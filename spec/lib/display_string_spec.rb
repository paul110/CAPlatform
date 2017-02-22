# frozen_string_literal: true
require 'rails_helper'

RSpec.describe DisplayString do
  let!(:board1) { create(:board, mac: "1234") }
  let!(:externalDatum) {create(:external_datum, data: [{href: '', title: 'First headline'}, {href: '', title: 'Second headline'}])}
  subject { DisplayString }

  describe "new" do
    it 'initializes and configures one board' do
      subject.new(board1.mac).configure_board
      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', 0, externalDatum.data.dig(0, "title")
    end
  end

  describe "run" do
    let(:subject_board) { subject.new board1.mac }

    before do
      allow(ActionCable.server).to receive(:broadcast).and_return true
    end

    it 'updates the metadata with the next headline' do
      current_index = board1.metadata.dig("id").to_i
      subject_board.run
      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', current_index + 1, externalDatum.data.dig(current_index + 1, "title")
    end

    it 'goes to first headline after reading all headlines' do
      externalDatum.data.length.times do
        subject_board.run
      end

      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', 0, externalDatum.data.dig(0, "title")
    end

    it "broadcasts the message" do
      subject_board.run

      expect(ActionCable.server).to have_received(:broadcast).with("sketch_channel", message: board1.reload.metadata)
    end
  end

  private

  def expect_metadata_to_eq board_metadata, type, id, value
    expect(board_metadata.dig("type")).to eq type
    expect(board_metadata.dig("id")).to eq id
    expect(board_metadata.dig("value")).to eq value
  end

end
