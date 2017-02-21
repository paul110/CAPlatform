# frozen_string_literal: true
require 'rails_helper'

RSpec.describe DisplayString do
  let!(:board1) { create(:board, mac: "1234") }
  let!(:externalDatum) {create(:external_datum, data: [{href: '', title: 'First headline'}, {href: '', title: 'Second headline'}])}
  subject { DisplayString }

  describe "new" do
    # before do
    #   allow(Toggle).to receive(:new).and_return(run_double)
    # end

    it 'initializes and configures one board' do
      subject.new board1.mac
      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', 0, externalDatum.data.dig(0, "title")
    end
  end

  describe "run" do
    before do
      @subjectBoard = subject.new board1.mac
      @currentIndex = board1.reload.metadata.dig("id")
    end
    it 'updates the metadata with the next headline' do

      @subjectBoard.run
      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', @currentIndex + 1, externalDatum.data.dig(@currentIndex + 1, "title")
    end

    it 'goes to first headline after reading all headlines' do
      externalDatum.data.length.times do
        @subjectBoard.run
      end

      board_metadata = board1.reload.metadata

      expect_metadata_to_eq board_metadata, 'lcd_display', 0, externalDatum.data.dig(0, "title")
    end
  end

  private 
  def expect_metadata_to_eq board_metadata, type, id, value
    expect(board_metadata.dig("type")).to eq type
    expect(board_metadata.dig("id")).to eq id
    expect(board_metadata.dig("value")).to eq value
  end

end
