
$execute if score #Timer.Second Auction matches 0..9 run data modify storage auction: Bid.Timer.Display[2] set value "0$(Second)"
$execute if score #Timer.Second Auction matches 10.. run data modify storage auction: Bid.Timer.Display[2] set value "$(Second)"

