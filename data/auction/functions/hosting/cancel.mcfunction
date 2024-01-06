## オークションの途中キャンセル
#> プレイヤー通知
    # tellraw
    tellraw @a[tag=Auction.Participant] [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.cancel_auction"}]

    # playsound
    execute as @a[tag=Auction.Participant] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0.5

#> もろもろリセット
    # タイマー
        # ボスバー
        bossbar remove auction:bid_timer

        # 表示用スコア
        scoreboard players set #BidTimer Auction -1

        # 内部データ
        data modify storage auction: Bid.Timer set value {}

    # 入札関連
        # プレイヤータグ
        tag @a remove Auction.Participant
        tag @a remove Auction.TopBidder

        # 内部データ
        data modify storage auction: Bid.Top set value 0
