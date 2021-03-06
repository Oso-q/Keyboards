# Treadstone32 Liteビルドガイド

## パーツ一覧

### キット付属品

| 基板番号 | 定数 | 数 | 名前 | 備考 |
| ---- | ---- | --- | --- | --- |
| - | - | 1 | PCB | 基板 |
| - | - | 32 | 1N4148 or 1SS178 | ロットにより1N4148（黒ライン）か1SS178（緑と黒のライン）どちらか |
| - | - | 1 | リセットスイッチ |  |
| - | - | 1 | マウントプレート | スイッチをはめ込むプレート |
| - | - | 1式 | アクリルケースパーツ | </br>2mmボトムプレート</br>2mmボトムミドル</br>5mmボトムミドル</br>5mmトップカバー |
| - | M2 8mm | 6 | 低頭ネジ |
| - | M2 4mm | 6 | 低頭ネジ |
| - | M2 スペーサー 7mm | 6 | 丸型 全ねじスペーサー |
| - | 2mm | 5 | ゴム脚 |  |

### キット以外に必要なもの

| 名前 | 数 | 備考 |
| ---- | ---- | --- |
| MicroUSBケーブル | 1本 | キーボードとPC接続用 |
| キースイッチ | 32個 | MX互換のもの |
| キーキャップ | 1U 30個、2U 2個 | MX互換のもの |
| ProMicro | 1個 | |
| コンスルー（スプリングピンヘッダ） 12P | 2個 | 推奨 |

### オプション

オプションでイルミネーション用LEDを取り付け可能です。  

| 名前 | 数 | 備考 |
| ---- | ---- | --- |
| LEDストリップ（WS2812B 6個付き） | 1個 | Underglow用（オプション） |

## 必要な道具

| 名前 | 備考 |
| ---- | ---- |
| はんだごて | |
| 糸ハンダ | 0.8mm程度のものを推奨します |
| ハンダ吸い取り線 | 失敗したとき用 |
| ニッパー | ダイオードのリード線などの切断用です |
| ピンセット | ProMicroリセットしたりチップLEDのはんだづけで使用します |
| フラックス除去剤 | 必須ではありませんがはんだ付け後のベタつきを除去出来、はんだによる黄色い変色も拭き取れてキレイな仕上がりになります |
| マスキングテープ | しるし付け、仮固定に使用。100均の柄付きでもOK |

　mteiさんの[Helix キーボードキットの製作に必要な工具メモ](https://gist.github.com/mtei/6957107a676ddfa85bde0ae41f8fa849)
やhdbxさんの[自作キーボードを始めるにあたって用意すべきツール](https://hdbx.hateblo.jp/entry/2018/06/01/215401)も参考になります。  

![img](../../_image/tool01.jpg)  
![img](../../_image/tool02.jpg)  

## 組み立て

　組み立ての時間ですが、1～6時間くらい（ファーム開発環境構築からだと別途+1～2時間程度）を目安にしてください。半田ごて作業していると一時間あっという間に飛びますので時々休憩を入れましょう。またハンダの煙は吸ったり目に入れたりしないように注意しましょう。  

## ProMicroの準備

　机にハンダごてを用意するその前に！ProMicroの準備を先にやってしまいましょう。  

### まずはモゲ対策

　ProMicroに使用されているUSBコネクタはコネクタ部に力がかかるともげやすいです（界隈ではそうなったProMicroは「モゲマイクロ」と呼ばれます）。そうなると買い直しとなるため最初に対策をしておきます。hdbxさんの[ProMicroのモゲ防止ついでにQMK_Firmwareを書き込む](https://qiita.com/hdbx/items/2f3e4ddfcadda2a5578e)を見てやってみてください。  
　エポキシ接着剤を使った場合1～2時間程度で（室温・気温によりますが）触っても大丈夫くらいになると思います。乾くまで時間が少しかかるのでファームウェアの書き込み準備をします。もしすでに準備が出来ているならその先に進んでください。  

### ファームウェアを準備する

　キーボード用のファームウェア（ハードウェア用の専用ソフトウェアのことをファームウェアと呼びます）の準備をします。  
  Treadstone32LiteはQMKというソフトウェアにキーマップを登録してあり、それをビルドしてProMicroに書き込むことでキーボードとして動作するようになっています。自分でソースからビルドが出来るようになるとキーを一つ一つ細かい動作まで自在にカスタムすることが出来ます。  

　可能なら[QMK - qmk/qmk_firmware](https://github.com/qmk/qmk_firmware)をクローンしてmake、書き込みまでチャレンジしてみてください。Windows環境でならMSYS2やWSLで仮想Linux環境上でmakeすることが出来ます。以下は参考になるサイトの紹介です。  

- Windows上でMSYS2からの環境構築は[さぼてんさん](https://twitter.com/cactusman)作成の記事[プログラマーではない人向けのQMK Firmware入門](https://qiita.com/cactusman/items/ac41993d1682c6d8a12e)
- Windows上でWSLからの環境構築は[qmk_firmwareをWindows上でmakeする方法](https://qiita.com/marksard/items/f381caf3ca981f307f64)を参照してファームウェアを書き込める環境を作ってください。
- Macな方はDocker使うほうが確実かもしれません。[自作キーボードに手を出した](https://poyo.hatenablog.jp/entry/2018/10/08/003800) の後半に記述があります。

　Treadstone32liteのデフォルトキーマップのmakeは ```make Treadstone32/lite:default``` で可能です。（Linux、Mac、MSYS2環境上なら ```make Treadstone32/lite:default:avrdude``` で書き込みも出来ます）  
　ProMicroにリセットボタンはないので、ProMicroのGNDピンとRSTピン（隣同士ならんでいます）をピンセットなどでショートさせてください。  

　ただしそこまで自信がない、ということであれば[QMK Configurator](https://config.qmk.fm/#/Treadstone32/lite/LAYOUT)のサイトでポチポチ作成し、DLのちQMK ToolboxでProMicroに書き込むことも出来ます。[サリチル酸さん](https://salicylic-acid3.hatenablog.com/)作成の記事[（初心者編）QMK Configuratorを使ってキーマップを書き換えよう](https://salicylic-acid3.hatenablog.com/entry/qmk-configurator)が参考になります。  

　また動作確認のため取り合えず適合するファームウェアが欲しい、ということであれば[QMKサイトで自動ビルドされるこれ](https://qmk.fm/compiled/Treadstone32_lite_default.hex)を使用してください。  

## ProMicroにピンヘッダをはんだ付けする

　ピンヘッダの取り付けは[Helixベータ ビルドガイド](https://github.com/MakotoKurauchi/helix/blob/master/Doc/buildguide_jp.md)
が丁寧なのでこちらを参照ください。  

### ProMicroの向き

　Helixのビルドガイド同様、ProMicroに部品が実装されていない面が上です。  

![img](../../_image/promicro01.jpg)  
![img](../../_image/promicro02.jpg)  

## 基板の裏と表について

　キースイッチが乗り、通常使用する際上を向く面を表、逆を裏とします。  
　Treadstone32Liteはロゴマークがシルク印刷されているほうが裏面です。  

## ダイオードをはんだ付けする

### ダイオードの脚を曲げる

　基板に付ける前にダイオードの脚を全部曲げてしまいます。基板の穴の間隔を見極めて曲げるための冶具を探してみてください。繋がったままの割りばしなどでも良いと思います。  

![img](../../_image/diode01.jpg)  

### ダイオードのはんだ付け

　ダイオードの取り付け向きは同じ方向なので、一つ確認して取り付けたら残りはすべて同じ方向で取り付けられます。ダイオードの黒や緑の帯側を基板のダイオード取り付け穴の四角いほうに向けて取り付けてください。  

![img](../../_image/diode02.png)  

　基板のウラ面からダイオードを差し込んでいきます。差し込んだらダイオードの足同士をネジって仮留めします。横一列ずつ差し込んでまとめてハンダ付けするとラクに速く出来ます。ハンダ付けしたら足を根元からカットしてください。  

## リセットボタンのはんだ付け

　スイッチがシルク印刷に収まる方向にはんだ付けしてください。  

![img](_image/lite_reset.jpg)  

## スイッチのはんだ付け

　スイッチの向きに注意してマウントプレートにはめこみます。そのあと、写真のように合わせてはんだ付けしてください。  
※写真は動作検証のためソケット化するカスタムをしています。

![img](_image/20200509-P5090001.jpg)  

## *(オプション)UnderglowLEDをはんだ付けする*

　テープLEDの剥離紙の両端数cmだけハサミなどでカットします。これはテープLEDの背面の端子と、キーボード基板のスルーホールなどの端子が接触して動作不良を起こすことを防ぐ意味合いがあります。  

![img](../../_image/led_tape.jpg)  

　テープLEDは向きがありテープLEDの端子と基板の端子が合う向きにします。
![img](_image/20200509-P5090001.jpg)  

## 動作確認をこの時点で行う

　あとはケースを組み立ててキーキャップをつけるだけですが、ケースを組み立てるのと分解するのが若干面倒なのと、ダイオードがキチンと半田付けされているかの動作確認を済ませておくとケース組み立てが一回で済むので「ファームウェアの準備と書き方」を見てファームウェアを書き込んで動作確認をしてください。  

### 動作確認

　デフォルトキーマップの場合、Lower、Raise（左親指キー、右親指キー）の順で押下するとAdjustレイヤーになります。押下したまま、Aキーを押下するとLEDのON/OFFです。光らない場合はLEDの取り付け向きやはんだ箇所をチェックしてください。  

## キーキャップの取り付け

　ケースの組み立て時、トップレイヤーとキーキャップが干渉しないように取り付ける必要があるので、先にキーキャップをハメ込んでください。  

## ケースの組み立て

　ケースのパーツは2mm厚のものと、5mm厚のものがあります。  
　2mmボトムプレートと2mmボトムレイヤーを合わせてみて、ボトムレイヤーにスペーサーをはめ込む場所が6箇所あります。その位置にボトムプレートへM2 4mmのネジで取り付けてください。  
　ProMicro用の切り欠きがあるので、写真のように2mmのフレームを合うように組み合わせてください。  

![img](_image/20200509-P5090002.jpg)  

以下の順番で乗せていきます。  

| 層名 | 厚み | 上 |
| --- | --- | --- |
| トップレイヤー | 5mm |  |
| マウントプレート(PCB付) | 1.2mm |  |
| ミドルレイヤー | 5mm |  |
| ボトムレイヤー | 2mm |  |
| ボトムプレート | 2mm | 下 |

　全部乗せたら、トップレイヤーの位置をキーキャップに干渉しないように位置を合わせながらM2 8mmネジで6箇所留めてください。  
　ゴム脚は四隅と、2つの親指キーの間手前に一つ貼ってください。  
　添付のゴム脚の厚みは1.6mmのものです。気になるようでしたら追加でゴム脚を貼ってみてください。  
　左奥側はProMicroに干渉するので、ゴム脚をカットして貼り付けてください。  
　また、ProMicroのピン部分が机に干渉する場合があるので、ニッパーでキレイにカットしておいてください。  

![img](_image/20200509-P5090002a.jpg)  

## 完成

　チェックして問題なさそうなら完成です！あなただけの一台に仕上げてください！  

![img](_image/20200119-P1190029.jpg)  

## キースイッチの交換方法

　手では取り外しにくいため、amazonなどで販売されているキースイッチ引き抜き工具を使用して交換してください。  
