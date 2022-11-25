# frozen_string_literal: true

module Api
  # API::CurbController
  class CurbController < ApplicationController
    def show
      Curb::ShowService.run(user_item_name: params[:item_name]).then do |result|
        return render json: { success: false, errors: result.errors.values } unless result.success?

        render json: {
          success: true,
          attachmentPartial: (render_to_string partial: '/games/results_popup',
                                               locals: { data: result.result })
        }
      end
    end
  end
end
