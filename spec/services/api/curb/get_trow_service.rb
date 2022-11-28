# frozen_string_literal: true

require 'rails_helper'

describe Api::Curb::GetTrowService do
  describe '#run' do
    subject(:run) { described_class.run }


    context 'when call is success' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(
          double("response", status: 200, body: JSON.generate({ "statusCode": 200, "body": "rock" })))
      end

      it 'returns success' do
        expect(run).to be_success
      end
    end

    context 'when call is failed 500' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(
          double("response", status: 500, body: JSON.generate({ "message": "some error" })))
      end

      it 'returns fail' do
        expect(run).not_to be_success
      end

      it 'returns fail with get_trow_error key' do
        expect(run.errors.symbolic).to eq({ "client" => :get_trow_error })
      end
    end

    context 'when call is failed not 500' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(
          double("response", status: 400, body: JSON.generate({ "message": "some error" })))
      end

      it 'returns fail' do
        expect(run).not_to be_success
      end

      it 'returns fail with unknown_get_trow_error key' do
        expect(run.errors.symbolic).to eq({ "client" => :unknown_get_trow_error })
      end
    end
  end
end
