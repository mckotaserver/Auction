## 金額にカンマをつける
#> 下から2桁を抽出
    # mod 100
    scoreboard players operation #Bid.DigitsModded Auction.Temp = #BidTop Auction.Temp
    scoreboard players operation #Bid.DigitsModded Auction.Temp %= #100 Constant

    # 一時ストレージに保存
    execute store result storage auction:temp NumberConversion.Digits int 1 run scoreboard players get #Bid.DigitsModded Auction.Temp

#> Listまわり
    # カンマ
    execute if data storage auction: Bid.Display[0] run data modify storage auction: Bid.Display prepend value ","

    # 0 Padding
    execute if score #Bid.DigitsModded Auction.Temp matches 0..9 unless score #BidTop Auction.Temp matches 1..9 run data modify storage auction: Bid.Display prepend value "0"

    # 中身
    data modify storage auction: Bid.Display prepend string storage auction:temp NumberConversion.Digits

#> 再起
    # 下2桁を削
    scoreboard players operation #BidTop Auction.Temp /= #100 Constant
    
    # 上で残り0でなければ再起
    execute if score #BidTop Auction.Temp matches 1.. run function auction:bid/menu/number_converesion

