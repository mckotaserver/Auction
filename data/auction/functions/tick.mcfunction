## Tick
#> タイマー
    # 減算
    execute if score #BidTimer Auction matches 1.. run scoreboard players remove #BidTimer Auction 1

    # ボスバー表示
    execute store result bossbar auction:bid_timer value run scoreboard players get #BidTimer Auction

    