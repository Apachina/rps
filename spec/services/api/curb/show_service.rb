# frozen_string_literal: true

require 'rails_helper'

describe Api::Curb::ShowService do
  let(:user_item_name) { 'rock' }

  describe '#run' do
    subject(:run) { described_class.run(user_item_name: user_item_name) }

    context 'when item is paper' do
      let(:curb_item) { Item.find_by(name: Enum::Item.value(:paper)) }

      before do
        allow_any_instance_of(Api::Curb::ShowService).to receive(:item).and_return(curb_item)
      end

      it 'returns success' do
        expect(run).to be_success
      end

      it 'returns needed fields' do
        expect(run.result).to include(:user_won, :draw, :curb_item)
      end

      it 'returns user loss' do
        expect(run.result).to match(user_won: false, draw: false, curb_item: curb_item)
      end
    end

    context 'when item is rock' do
      let(:curb_item) { Item.find_by(name: Enum::Item.value(:rock)) }

      before do
        allow_any_instance_of(Api::Curb::ShowService).to receive(:item).and_return(curb_item)
      end

      it 'returns user loss' do
        expect(run.result).to match(user_won: false, draw: true, curb_item: curb_item)
      end
    end

    context 'when item is scissors' do
      let(:curb_item) { Item.find_by(name: Enum::Item.value(:scissors)) }

      before do
        allow_any_instance_of(Api::Curb::ShowService).to receive(:item).and_return(curb_item)
      end

      it 'returns user loss' do
        expect(run.result).to match(user_won: true, draw: false, curb_item: curb_item)
      end
    end
  end
end
