# frozen_string_literal: true

# GamesController
class GamesController < ApplicationController
  def index
    @items = Item.all
  end
end
