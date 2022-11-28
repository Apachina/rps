# frozen_string_literal: true

require 'faraday'

module Api
  module Curb
    # Get Curb's trow from rps-stage and returns item name with down case.
    ## parsed_data['body'] returns one of "rock", "paper", "scissors".
    class GetTrowService < Mutations::Command
      BASE_URL = ENV['GET_TROW_BASE_URL']

      HTTP_CLIENT = Faraday.new(BASE_URL)

      def execute
        return add_error(:client, :get_trow_error, data_parse(trow_body)) if trow.status == 500

        data_parse(trow_body).then do |parsed_data|
          return add_error(:client, :unknown_get_trow_error, parsed_data) if parsed_data['statusCode'] != 200

          parsed_data['body'].downcase
        end
      end

      private

      def data_parse(data)
        JSON.parse(data)
      end

      def trow_body
        trow.body
      end

      def trow
        @trow ||= HTTP_CLIENT.get('/rps-stage/throw')
      end
    end
  end
end
