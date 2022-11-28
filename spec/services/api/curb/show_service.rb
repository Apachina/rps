# frozen_string_literal: true

require 'rails_helper'

describe Api::Curb::ShowService do
  let(:user_item_name) { 'rock' }

  describe '#run' do
    subject(:run) { described_class.run(user_item_name: user_item_name) }

    before do
      allow_any_instance_of(described_class).to receive(:item).and_return(curb_item)
      allow(Api::Curb::GetTrowService).to receive(:run)
        .and_return(Mutations::Outcome.new(false, nil, nil, nil))
    end

    context 'when GetTrowService does not returns results' do
      context 'when item is paper' do
        let(:curb_item) { Item.find_by(name: Enum::Item.value(:paper)) }

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

        it 'returns user loss' do
          expect(run.result).to match(user_won: false, draw: true, curb_item: curb_item)
        end
      end

      context 'when item is scissors' do
        let(:curb_item) { Item.find_by(name: Enum::Item.value(:scissors)) }

        it 'returns user loss' do
          expect(run.result).to match(user_won: true, draw: false, curb_item: curb_item)
        end
      end
    end

    context 'when GetTrowService returns data' do
      before do
        allow(Api::Curb::GetTrowService).to receive(:run)
          .and_return(Mutations::Outcome.new(true, curb_item, nil, nil))
      end

      context 'when item is paper' do
        let(:curb_item) { Item.find_by(name: Enum::Item.value(:paper)) }

        it 'returns success' do
          expect(run).to be_success
        end

        it 'returns user loss' do
          expect(run.result).to match(user_won: false, draw: false, curb_item: curb_item)
        end
      end
    end
  end
end
