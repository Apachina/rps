# frozen_string_literal: true

module Api
  module Curb
    # Curb choose and game results
    class ShowService < Mutations::Command
      required do
        string :user_item_name
      end

      def execute
        {
          user_won: user_won?,
          draw: draw?,
          curb_item: item
        }
      end

      private

      def draw?
        user_item == item
      end

      def user_won?
        user_item.defeated_item == item
      end

      def user_item
        @user_item ||= Item.find_by(name: Enum::Item.value(user_item_name.to_sym))
      end

      def item
        @item ||= Item.all.sample
      end
    end
  end
end
