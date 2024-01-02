## エントリ番号の生成
# 乱数生成
# エントリー者データの中に同じ数字が出ていないかチェック
$execute if data storage auction:temp {Entry:{PlayerData:[{Number:$(GeneratedNumber)}]}} store result storage auction:temp Entry.GeneratedNumber int 1 run random value 0..99
$execute if data storage auction:temp {Entry:{PlayerData:[{Number:$(GeneratedNumber)}]}} run function auction:entry/number_check with storage storage auction:temp Entry

