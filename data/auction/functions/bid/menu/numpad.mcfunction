## メニュー内数字クリック
#> 計算
    # 繰り上がり処理
    scoreboard players operation @s Auction.Bid *= #10 Constant
    scoreboard players operation @s Auction.Bid += #ClickedNumber Auction.Temp

#> エラー出力
    # 入力上限 (もとに戻す)
    execute if score @s Auction.Bid > #BidMax Auction.Temp run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.error.bid_too_big"}]
    execute if score @s Auction.Bid > #BidMax Auction.Temp run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if score @s Auction.Bid > #BidMax Auction.Temp run scoreboard players operation @s Auction.Bid /= #10 Constant

    execute if score @s Auction.Bid > #BidMax Auction.Temp run return -1

#> プレイヤー通知
    # playsound
    playsound block.note_block.bit master @s ~ ~ ~ 1 1.5
