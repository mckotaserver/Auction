## 入札開始前 カウントダウン
#> 終了処理
    # 残り0 → 入札終了, カウント停止
    execute store success storage auction:temp BidEnded byte 1 if data storage auction: {Bid:{Timer:{Raw:0}}}

    execute if data storage auction:temp {BidEnded:true} as @a[tag=Auction.Participant] run function auction:bid/end
    execute if data storage auction:temp {BidEnded:true} run return -1

#> 表示
    # 時間表示設定
        # セットアップ
        data modify storage auction: Bid.Timer.Display set value ["0",":","0"]

        execute store result score #Timer.Second Auction run data get storage auction: Bid.Timer.Raw
        execute store result score #Timer.Minute Auction run data get storage auction: Bid.Timer.Raw

        scoreboard players operation #Timer.Minute Auction /= #60 Constant
        scoreboard players operation #Timer.Second Auction %= #60 Constant
        
        # 秒
        execute store result storage auction: Bid.Timer.Second int 1 run scoreboard players get #Timer.Second Auction
        data modify storage auction: Bid.Timer.Display[2] set string storage auction: Bid.Timer.Second

        execute if score #Timer.Second Auction matches 0..9 run data modify storage auction: Bid.Timer.Display insert 2 value "0"

        # 分
        execute store result storage auction: Bid.Timer.Minute int 1 run scoreboard players get #Timer.Minute Auction
        data modify storage auction: Bid.Timer.Display[0] set string storage auction: Bid.Timer.Minute

    # ボスバー
    bossbar set auction:bid_timer name [{"text": "入札残り時間: ","color": "gold"},{"nbt":"Bid.Timer.Display","storage": "auction:","color": "white","interpret": true}]

#> プレイヤー通知, 適宜カウント等
    # title
    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] run title @s title ""
    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] run title @s times 6t 20t 3t

    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] run title @s subtitle [{"text": "- ","color": "gray"},{"nbt":"Bid.BidTimer","storage":"auction:","color": "gold"},{"text": " -","color": "gray"}]
    
    execute if data storage auction: {Bid:{Timer:{Raw:60}}} as @a[tag=Auction.Participant] run title @s subtitle [{"text": "- ","color": "gray"},{"nbt":"Bid.BidTimer","storage":"auction:","color": "gold"},{"text": " -","color": "gray"}]

    # playsound
    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2
    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 2

    execute if score #BidTimer Auction matches ..99 as @a[tag=Auction.Participant] run title @s subtitle [{"text": "- ","color": "gray"},{"nbt":"Bid.Timer.Second","storage":"auction:","color": "gold"},{"text": " -","color": "gray"}]
    
#> 再帰処理
    # 減算
    execute store result storage auction: Bid.Timer.Raw int 0.9999 run data get storage auction: Bid.Timer.Raw

    # 再起
    schedule function auction:bid/bid_countdown 20t
    
