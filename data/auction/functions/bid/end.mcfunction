## 入札終了
#> タイマー停止
    # スコア
    scoreboard players set #BidTimer Auction -1

    # 内部データ
    data modify storage auction: Bid.Timer set value {}

    # ボスバー
    bossbar remove auction:bid_timer

#> プレイヤー通知
    # playsound
    playsound block.note_block.pling master @s ~ ~ ~ 1 1.5
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.75

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_end"}]

    execute if entity @a[tag=Auction.TopBidder] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.buyer_announce","with":[{"selector":"@a[tag=Auction.TopBidder]","color": "green"},{"storage":"auction:","nbt":"Bid.Display","interpret": true,"color": "gold"}]}]
    execute unless entity @a[tag=Auction.TopBidder] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.no_buyer"}]
    
#> 後処理
    # 
    scoreboard players set @a[tag=Auction.Participant] Auction.Temp -1
    scoreboard players set @a[tag=Auction.Participant] Auction.Bid 0

    scoreboard players set #BidTop Auction.Bid 0
    scoreboard players set #BidMin Auction.Bid 0

    # タグ除去
    tag @a[tag=Auction.Participant] remove Auction.Participant
    tag @a[tag=Auction.TopBidder] remove Auction.TopBidder
    