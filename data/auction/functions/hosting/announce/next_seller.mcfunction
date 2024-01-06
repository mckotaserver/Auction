## 次の出品者告知
#> 出品者選出
    # 最大値はいくつ
    scoreboard players set #NextSellerNumber Auction.Temp -1
    scoreboard players operation #NextSellerNumber Auction.Temp > @a[tag=Auction.Entried] Auction.EntryNumber

    # 最大値に一致する人
    execute as @a[tag=Auction.Entried] if score @s Auction.EntryNumber = #NextSellerNumber Auction.Temp run tag @s add Auction.Temp-NextSeller

    # 出品者タグ, スコアを削除
    tag @a[tag=Auction.Temp-NextSeller] remove Auction.Entried
    scoreboard players reset @a[tag=Auction.Temp-NextSeller] Auction.EntryNumber

#> いない → 
    # tellraw
    execute unless entity @a[tag=Auction.Temp-NextSeller] at @e[tag=Auction.StageMarker] as @a[distance=..32] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.no_seller"}]
    
    # playsound
    execute unless entity @a[tag=Auction.Temp-NextSeller] at @e[tag=Auction.StageMarker] as @a[distance=..32] at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 0.5

    # 中断
    execute unless entity @a[tag=Auction.Temp-NextSeller] run return -1

#> プレイヤー通知
    # tellraw
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.next_seller","with":[{"selector":"@a[tag=Auction.Temp-NextSeller]","color": "green"}]}]

    # playsound 
    execute at @e[tag=Auction.StageMarker] as @a[distance=..32] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2

#> 後処理
    # 一時タグ除去
    tag @a[tag=Auction.Temp-NextSeller] remove Auction.Temp-NextSeller