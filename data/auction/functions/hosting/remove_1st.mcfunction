## 最高額取り消し
#> 内部処理
    # 現1位を削除
    scoreboard players set @a[tag=Auction.TopBidder] Auction.Bid 0
    tag @a[tag=Auction.TopBidder] remove Auction.TopBidder

    # 新1位の入札額を取得, 更新
    scoreboard players operation #BidTop Auction.Temp > @a Auction.Bid
    execute store result storage auction: Bid.Top int 1 run scoreboard players get #BidTop Auction.Temp

    # 新1位にタグ
    execute as @a if score @s Auction.Bid = #BidTop Auction.Temp run tag @s add Auction.TopBidder

    # 表示データの更新
    data modify storage auction: Bid.Display set value []

    function auction:bid/menu/number_converesion

#> プレイヤー通知
    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.remove_1st","with":[{"selector":"@a[tag=Auction.TopBidder]","color": "green"},{"storage":"auction:","nbt":"Bid.Display","interpret": true,"color": "gold"}]}]

    # playsound
    execute as @a[tag=Auction.Participant] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0.5

