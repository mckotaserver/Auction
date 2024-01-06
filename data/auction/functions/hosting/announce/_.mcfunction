## 案内
# ストレージ内の値に応じてtellraw
execute if data storage auction: {Message:0} run function auction:hosting/announce/next_seller
execute if data storage auction: {Message:1} at @e[tag=Auction.StageMarker] as @a[distance=..32] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.announce_1"}]
execute if data storage auction: {Message:2} at @e[tag=Auction.StageMarker] as @a[distance=..32] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.announce_2"}]
execute if data storage auction: {Message:3} at @e[tag=Auction.StageMarker] as @a[distance=..32] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.announce_3"}]

# playsound
execute at @e[tag=Auction.StageMarker] as @a[distance=..32] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1.5

#> メッセージ繰り管理
    # +1
    execute store result score #BeforeBid.Message Auction run data get storage auction: Message
    scoreboard players add #BeforeBid.Message Auction 1

    # 最大値以上なら0に
    execute if score #BeforeBid.Message Auction matches 4.. run scoreboard players set #BeforeBid.Message Auction 0

    # ストレージに戻す
    execute store result storage auction: Message int 1 run scoreboard players get #BeforeBid.Message Auction
