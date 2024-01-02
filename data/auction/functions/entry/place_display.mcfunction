## エントリー ディスプレイ 設置
# kill
kill @e[tag=Auction.EntryDisplay]

# text_display
$execute align xyz run summon text_display ~0.5 ~0.5 ~0.5 {Tags:["Auction.EntryDisplay.Text","Auction.EntryDisplay"],text:"",Rotation:[$(Facing)f,0f]}

execute if data storage auction: {EntryAvailable:true} run data modify entity @e[tag=Auction.EntryDisplay.Text,limit=1] text set value '[{"text": "エントリー: ","color": "white"},{"text": "受付中\\n","color": "green","bold": true},{"text": "[","color": "white","bold": true},{"text": "エントリー","color": "yellow","bold": true},{"text": "]","color": "white","bold": true}]'
execute if data storage auction: {EntryAvailable:false} run data modify entity @e[tag=Auction.EntryDisplay.Text,limit=1] text set value '[{"text": "エントリー: ","color": "white"},{"text": "期間外\\n","color": "red","bold": true},{"text": "現在はエントリーできません。","color": "red","bold": false}]'

# interaction
execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^0.6 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}
execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^0.4 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}
execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^0.2 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}

execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^ ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}

execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^-0.2 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}
execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^-0.4 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}
execute at @e[tag=Auction.EntryDisplay.Text] run summon interaction ^-0.6 ^0.05 ^ {Tags:["Auction.EntryDisplay.Interaction","Auction.EntryDisplay"],height:0.2f,width:0.2f}

