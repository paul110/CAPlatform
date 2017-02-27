# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SyncData do
  let!(:board1) { create(:board, mac: "1234", metadata: {})}
  let!(:board2) { create(:board, mac: "5678", metadata: {title: "Hello world"}) }
  let!(:link) { {from:"5678", to: "1234", logic: "sync_data"} }
  subject { SyncData }

  describe 'run' do
    let!(:sync_data_coderunner) { subject.new(board1.mac) }

    it 'updates the metadata from board1 with metadata from board2' do
      sync_data_coderunner.run board2
      board1.reload
      expect(board1.metadata).to eq board2.metadata
    end
  end

end
