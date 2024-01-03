## 入札終了
#> タイマー停止
    # スコア
    scoreboard players set #BidTimer Auction -1

    # 内部データ
    data modify storage auction: Bid.Timer set value {}

    # ボスバー
    bossbar remove auction:bid_timer

#> 落札データ
    # Name


#> プレイヤー通知
    # playsound
    playsound block.note_block.pling master @s ~ ~ ~ 1 2
    playsound block.note_block.bit master @s ~ ~ ~ 1 2
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.75

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_end"}]

    execute if entity @a[tag=Auction.TopBidder] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.buyer_announce"}]
    execute unless entity @a[tag=Auction.TopBidder] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.no_buyer"}]
    
#> 後処理
    # タグ除去
    tag @a[tag=Auction.Participant] remove Auction.Participant
    tag @a[tag=Auction.TopBidder] remove Auction.TopBidder
    
    