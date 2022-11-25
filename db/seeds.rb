# Creating each of items

['Rock', 'Scissors', 'Paper'].each do |item_name|
  item = Item.create(name: item_name, image_url: item_name.downcase + '.svg')
end


# Rules

## Rock beats scissors
## Scissors beats paper
## Paper beats rock
{ rock: :scissors, scissors: :paper, paper: :rock }.each do |winner_key, loser_key|
  winner_item = Item.find_by(name: Enum::Item.value(winner_key))
  loser_item = Item.find_by(name: Enum::Item.value(loser_key))
  byebug
  VictoryRule.create(item_id: winner_item.id, loser_id: loser_item.id)
end
