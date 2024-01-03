## Tick
#> タイマー
    # 減算
    execute if score #BidTimer Auction matches 1.. run scoreboard players remove #BidTimer Auction 1

    # ボスバー表示
    execute store result bossbar auction:bid_timer value run scoreboard players get #BidTimer Auction

#> 入札表示 
    # 最高額
    execute if data storage auction: Bid.Timer.Raw if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] times 0 10 5
    execute if data storage auction: Bid.Timer.Raw if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] title ""
    execute if data storage auction: Bid.Timer.Raw if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] subtitle {"translate":"kota-server.auction.title.top_bidder","with":[{"selector":"@a[tag=Auction.TopBidder]","color": "green","bold": true},{"storage":"auction:","nbt":"Bid.Display","interpret": true,"color": "gold"}]}

