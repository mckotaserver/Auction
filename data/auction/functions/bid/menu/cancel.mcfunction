## 確認画面: 入力キャンセル
# 一時スコアリセット
scoreboard players set @s Auction.Temp 0

# プレイヤー通知
    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.bid_cancel"}]

    # playsound
    playsound block.note_block.bit master @s ~ ~ ~ 1 0.5
    