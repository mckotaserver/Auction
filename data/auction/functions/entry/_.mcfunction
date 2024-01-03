## エントリー
# トリガー解除
advancement revoke @s only auction:on_entry/left
advancement revoke @s only auction:on_entry/right

#> エラー出力
    # エントリー期間外 (このとき警告なし)
    execute if data storage auction: {EntryAvailable:false} run return -1

    # すでにエントリー済み
    execute if entity @s[tag=Auction.Entried] run tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.error.already_entried"}]
    execute if entity @s[tag=Auction.Entried] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if entity @s[tag=Auction.Entried] run return -1

#> エントリー処理
    # スコア = エントリー番号 設定
        # 既出の番号でないかチェック
        data modify storage auction:temp Entry.PlayerData set from storage auction: PlayerEntryData
        execute store result storage auction:temp Entry.GeneratedNumber int 1 run random value 0..99

        function auction:entry/number_check with storage auction:temp Entry

        # エントリーデータの作成
        setblock ~ -64 ~ shulker_box replace
        loot replace block ~ -64 ~ container.0 loot auction:player_head

        data modify storage auction: PlayerEntryData append value {}
        data modify storage auction: PlayerEntryData[0].Number set from storage auction:temp Entry.GeneratedNumber
        data modify storage auction: PlayerEntryData[0].Name set from block ~ -64 ~ Items[0].tag.SkullOwner.Name
        
        setblock ~ -64 ~ air replace

        # 上で出力された数字は使用可能
        execute store result score @s Auction.EntryNumber run data get storage auction:temp Entry.GeneratedNumber

    # タグ付与
    tag @s add Auction.Entried

#> 演出
    # playsound 
    playsound block.note_block.bit master @s ~ ~ ~ 1 2

    # tellraw
    tellraw @s [{"translate":"kota-server.auction.message.prefix"},{"translate":"kota-server.auction.message.entried_successfully","with":[{"score":{"name": "@s","objective": "Auction.EntryNumber"},"color": "green","underlined": true}]}]


