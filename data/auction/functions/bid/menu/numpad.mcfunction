## メニュー内数字クリック
#> エラー出力  
    # 入札期間外
        execute unless data storage auction: Bid.Timer.Raw run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.error.bid_inactive"}]
        execute unless data storage auction: Bid.Timer.Raw run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute unless data storage auction: Bid.Timer.Raw run return -1
        
#> 計算
    # リセット
    # scoreboard players set @s Auction.Temp 0

    # 現在入札額取得
    execute if score @s Auction.Temp matches -1 run scoreboard players operation @s Auction.Temp = @s Auction.Bid

    # 繰り上がり処理
    scoreboard players operation @s Auction.Temp *= #10 Constant
    scoreboard players operation @s Auction.Temp += #ClickedNumber Auction.Temp

    tellraw @a {"score":{"name": "@s","objective": "Auction.Temp"}}

#> エラー出力
    # 入力上限 (もとに戻す)
    execute if score @s Auction.Temp > #BidMax Auction.Temp run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.error.bid_too_big"}]
    execute if score @s Auction.Temp > #BidMax Auction.Temp run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if score @s Auction.Temp > #BidMax Auction.Temp run scoreboard players operation @s Auction.Temp /= #10 Constant

    execute if score @s Auction.Temp > #BidMax Auction.Temp run return -1

#> プレイヤー通知
    # playsound
    playsound block.note_block.bit master @s ~ ~ ~ 1 1.5
