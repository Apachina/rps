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

      def find_item_by_name(name)
        Item.find_by!(name: name)
      end

      def user_item
        @user_item ||= find_item_by_name(Enum::Item.value(user_item_name.to_sym))
      end

      def item
        @item ||= trow ? find_item_by_name(Enum::Item.value(trow.to_sym)) : Item.all.sample
      end

      def trow
        Api::Curb::GetTrowService.run.then do |data|
          @trow ||= data.success? ? data.result : nil
        end
      end
    end
  end
end
