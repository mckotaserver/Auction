## 入札開始前 カウントダウン
#> 開始処理
    # 残り0 → 本開始, カウント停止
    execute if data storage auction: {Countdown:{Timer:0}} run function auction:bid/start
    execute if data storage auction: {Countdown:{Timer:0}} run return -1

#> プレイヤー通知
    # playsound
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 1

    # title
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] run title @s title ""
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] run title @s times 6t 20t 3t

    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] run title @s subtitle [{"text": "- ","color": "gray"},{"nbt":"Countdown.Timer","storage":"auction:","color": "gold"},{"text": " -","color": "gray"}]
    
#> 再帰処理
    # 減算
    execute store result storage auction: Countdown.Timer int 0.9999 run data get storage auction: Countdown.Timer

    # 再起
    schedule function auction:bid/start_countdown 20t
    
