## 入札開始前
#> カウントダウン
    # 3秒
    data modify storage auction: Countdown.Timer set value 3

    # タイマー実行
    function auction:bid/start_countdown

