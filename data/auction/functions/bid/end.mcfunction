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
    playsound block.note_block.pling master @s ~ ~ ~ 1 1

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_end"}]


    