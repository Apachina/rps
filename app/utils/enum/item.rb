# frozen_string_literal: true

module Enum
  # Item enums
  class Item
    include Ruby::Enum

    define :rock, 'Rock'
    define :scissors, 'Scissors'
    define :paper, 'Paper'
  end
end
