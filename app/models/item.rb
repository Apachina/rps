class Item < ApplicationRecord
  has_one :victory_rule
  has_one :defeated_item, through: :victory_rule
end
