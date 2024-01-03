## Load
# スコアボード定義
scoreboard objectives add Auction.EntryNumber dummy [{"text":"【","color": "white"},{"text":"エントリー番号","color": "gold"},{"text":"】","color": "white"}]
scoreboard objectives add Auction dummy
scoreboard objectives add Auction.Temp dummy
scoreboard objectives add Auction.Bid dummy

scoreboard objectives add Constant dummy
    scoreboard players set #10000 Constant 10000
    scoreboard players set #1000 Constant 1000
    scoreboard players set #60 Constant 60
    scoreboard players set #10 Constant 10
    