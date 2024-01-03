## 入札処理 (引き継ぎ)
#> エラー出力  
    # 入札期間外
    execute unless data storage auction: Bid.Timer.Raw run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.error.bid_inactive"}]
    execute unless data storage auction: Bid.Timer.Raw run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute unless data storage auction: Bid.Timer.Raw run return -1

    # 最低入札額より小さい
    execute store result score #BidMin Auction.Temp run data get storage auction: Bid.Top
    scoreboard players add #BidMin Auction.Temp 100

    execute if score @s Auction.Bid < #BidMin Auction.Temp run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.error.bid_too_small"}]
    execute if score @s Auction.Bid < #BidMin Auction.Temp run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if score @s Auction.Bid < #BidMin Auction.Temp run return -1

#> 入札額更新
    # 最高額更新
    execute store result storage auction: Bid.Top int 1 run scoreboard players get @s Auction.Bid
    
    # 金額にカンマ付け
    execute store result score #BidTop Auction.Temp run data get storage auction: Bid.Top 
    data modify storage auction: Bid.Display set value []

    function auction:bid/menu/number_converesion

    # 最高入札者タグ
    tag @a remove Auction.TopBidder
    tag @s add Auction.TopBidder

#> プレイヤー通知
    # tellraw
    tellraw @a[tag=Auction.Participant] [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.player_bidded","with":[{"selector":"@s","color": "green"},{"nbt":"Bid.Display","storage":"auction:","color": "gold"}]}]

    # playsound
    execute as @a[tag=Auction.Participant] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 1.8
    execute as @a[tag=Auction.Participant] at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 2

#> タイマーの繰り上げ
    # 内部データ
    data modify storage auction: Bid.Timer.Raw set value 30

    # 表示用スコア
    scoreboard players set #BidTimer Auction 600

    # ボスバー
    bossbar add auction:bid_timer [{"text": "入札残り時間: ","color": "gold"},{"text": "0:30","color": "yellow"}]

    bossbar set auction:bid_timer color red
    bossbar set auction:bid_timer max 600

    # 開始
    schedule clear auction:bid/bid_countdown 
    schedule function auction:bid/bid_countdown 20t
