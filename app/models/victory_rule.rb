# frozen_string_literal: true

class VictoryRule < ApplicationRecord
  belongs_to :won_item
  belongs_to :defeated_item, class_name: 'Item', foreign_key: 'loser_id'
end
