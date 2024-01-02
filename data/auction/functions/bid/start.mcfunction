## 入札開始
#> プレイヤー通知
    # playsound
    playsound block.note_block.pling master @s ~ ~ ~ 1 1

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_start"}]

#> 入札タイマー
    # 内部データ
    data modify storage auction: Bid.Timer.Raw set value 180

    # 表示用スコア
    scoreboard players set #BidTimer Auction 3600

    # ボスバーセットアップ
    bossbar set auction:bid_timer color yellow
    bossbar set auction:bid_timer max 3600
    bossbar add auction:bid_timer [{"text": "入札残り時間: ","color": "gold"},{"text": "3:00","color": "white"}]

    bossbar set auction:bid_timer players @s

    # カウントダウン開始
    schedule function auction:bid/bid_countdown 20t

    