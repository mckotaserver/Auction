## エントリー 可/不可 を切り替え
#> 内部処理
    # 現在の状態
    data modify storage auction:temp EntryAvailable set from storage auction: EntryAvailable
    execute unless data storage auction:temp EntryAvailable run data modify storage auction: EntryAvailable set value true

    # トグル
    execute if data storage auction:temp {EntryAvailable:true} run data modify storage auction: EntryAvailable set value false
    execute if data storage auction:temp {EntryAvailable:false} run data modify storage auction: EntryAvailable set value true

    # タグ付きプレイヤーが残っていたら削除
    execute if data storage auction: {EntryAvailable:true} run tag @a[tag=Auction.Entried] remove Auction.Entried

#> プレイヤー通知
    # tellraw
        # 開始
        execute if data storage auction: {EntryAvailable:true} run tellraw @a [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.entry_enabled"}]
        
        # 終了
        execute if data storage auction: {EntryAvailable:false} run tellraw @a [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.entry_disabled"}]

    # playsound
        # 開始
        execute if data storage auction: {EntryAvailable:true} as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 0.5 2

        # 終了
        execute if data storage auction: {EntryAvailable:false} as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 0.5 0.7

    # ディスプレイ書き換え
        # 開始 
        execute if data storage auction: {EntryAvailable:true} as @a at @s run data modify entity @e[tag=Auction.EntryDisplay.Text,limit=1] text set value '[{"text": "エントリー: ","color": "white"},{"text": "受付中\\n","color": "green","bold": true},{"text": "[","color": "white","bold": true},{"text": "エントリー","color": "yellow","bold": true},{"text": "]","color": "white","bold": true}]'

        # 終了
        execute if data storage auction: {EntryAvailable:false} as @a at @s run data modify entity @e[tag=Auction.EntryDisplay.Text,limit=1] text set value '[{"text": "エントリー: ","color": "white"},{"text": "期間外\\n","color": "red","bold": true},{"text": "現在はエントリーできません。","color": "red","bold": false}]'

    # エントリー番号の表示
    execute if data storage auction: {EntryAvailable:true} run scoreboard objectives setdisplay sidebar Auction.EntryNumber