## 入札開始
#> プレイヤー通知
    # playsound
    execute at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_start"}]

#> 入札タイマー
    # 内部データ
    data modify storage auction: Bid.Timer.Raw set value 180

    # 表示用スコア
    scoreboard players set #BidTimer Auction 3600

    # ボスバーセットアップ
    bossbar add auction:bid_timer [{"text": "入札残り時間: ","color": "gold"},{"text": "3:00","color": "white"}]

    bossbar set auction:bid_timer color yellow
    bossbar set auction:bid_timer max 3600
    
    bossbar set auction:bid_timer players @s

# 最低入札額設定
data modify storage auction: Bid.Top set value 900
scoreboard players set #BidMin Auction 1000

    # カウントダウン開始
    function auction:bid/bid_countdown 

    