# Treadstone48 ビルドガイド

## パーツ一覧

### キット付属品

*2019/07/08：パーツ構成をアップデートしました。ネジをすべて黒にしました。2mmプラスチックスペーサーとTRRSジャックは付属品から外しました。*

| 名前 | 数 | 備考 |
| ---- | ---- | --- |
| PCB | 1枚 | いわゆる基板です |
| トッププレート | 1枚| スイッチを取り付ける穴があいてます |
| ボトムプレート | 1枚| アクリル製 |
| OLED・ProMicro保護プレート | 1枚 | アクリル製 |
| M2スペーサー 8mm | 2個 | 基板・保護プレート接続用 |
| M2スペーサー 7mm | 8個 | トップ・ボトムプレート接続用 |
| M2ネジ 4mm| 20個 |  |
| ゴム足 | 8個 | 小8個 |
| ダイオード | 48個 | 1N4148 |
| タクトスイッチ | 1個 | リセットスイッチ用 |

### キット以外に必要なもの

| 名前 | 数 | 備考 |
| ---- | ---- | --- |
| MicroUSBケーブル | 1本 | キーボードとPC接続用 |
| キースイッチ | 47～48個 | MX互換のもの |
| キーキャップ | 47～48個 | MX互換のもの |
| MXソケット | 47〜48個 | MXスイッチ用ソケット |
| Pro Micro | 1個 | |
| コンスルー（スプリングピンヘッダ） 12P | 2個 | 推奨 |

### オプション

オプションでイルミネーション用LEDと情報表示用のOLEDが取り付け可能です。  

| 名前 | 数 | 備考 |
| ---- | ---- | --- |
| スタビライザー | 1～4個 | Shiftキー位置(プレートマウント、PCBマウント対応)<br/>Enter位置(プレートマウント、PCBマウント対応)<br/>スペース位置(プレートマウントのみ対応)（すべてオプション） |
| LEDストリップ（WS2812B 6個付き） | 2個 | Underglow用（オプション） |
| OLEDモジュール | 1個 | OLED用（オプション）取り付け高難易度のため非推奨 |
| ピンソケット 4P | 1個 | OLED用（オプション）取り付け高難易度のため非推奨<br/>2.54mmピッチ、ロープロファイル（低背）基板取り付け高さ3.5mm、1x4のもの<br/>秋月電子かヒロスギネットで購入可能 |
| ピンヘッダ 4P | 1個 | OLED用（オプション）取り付け高難易度のため非推奨 |
| TRRSジャック | 1個 | オプションのRhymestone接続用。繋がないなら取り付け不要 |
| 3.5mmステレオケーブル(3極) | 1本 | Rhymestoneとの接続用（オプション） |

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
  Treadstone48はQMKというソフトウェアにキーマップを登録してあり、それをビルドしてProMicroに書き込むことでキーボードとして動作するようになっています。自分でソースからビルドが出来るようになるとキーを一つ一つ細かい動作まで自在にカスタムすることが出来ます。  

　可能なら[QMK - qmk/qmk_firmware](https://github.com/qmk/qmk_firmware)をクローンしてmake、書き込みまでチャレンジしてみてください。Windows環境でならMSYS2やWSLで仮想Linux環境上でmakeすることが出来ます。以下は参考になるサイトの紹介です。  

- Windows上でMSYS2からの環境構築は[さぼてんさん](https://twitter.com/cactusman)作成の記事[プログラマーではない人向けのQMK Firmware入門](https://qiita.com/cactusman/items/ac41993d1682c6d8a12e)
- Windows上でWSLからの環境構築は[qmk_firmwareをWindows上でmakeする方法](https://qiita.com/marksard/items/f381caf3ca981f307f64)を参照してファームウェアを書き込める環境を作ってください。
- Macな方はDocker使うほうが確実かもしれません。[自作キーボードに手を出した](https://poyo.hatenablog.jp/entry/2018/10/08/003800) の後半に記述があります。

　Treadstone48のデフォルトキーマップのmakeは ```make treadstone48/rev1:default``` で可能です。（Linux、Mac、MSYS2環境上なら ```make treadstone48/rev1:default:avrdude``` で書き込みも出来ます）  
　ProMicroにリセットボタンはないので、ProMicroのGNDピンとRSTピン（隣同士ならんでいます）をピンセットなどでショートさせてください。  

　ただしそこまで自信がない、ということであれば[QMK Configurator](https://config.qmk.fm/#/treadstone48/rev2/LAYOUT_base)のサイトでポチポチ作成し、DLのちQMK ToolboxでProMicroに書き込むことも出来ます。[サリチル酸さん](https://salicylic-acid3.hatenablog.com/)作成の記事[（初心者編）QMK Configuratorを使ってキーマップを書き換えよう](https://salicylic-acid3.hatenablog.com/entry/qmk-configurator)が参考になります。  

　また動作確認のため取り合えず適合するファームウェアが欲しい、ということであれば[QMKサイトで自動ビルドされるこれ](https://qmk.fm/compiled/treadstone48_rev1_default.hex)を使用してください。  

## ProMicroにピンヘッダをはんだ付けする

　ピンヘッダの取り付けは[Helixベータ ビルドガイド](https://github.com/MakotoKurauchi/helix/blob/master/Doc/buildguide_jp.md)
が丁寧なのでこちらを参照ください。  

### ProMicroの向き

　Helixのビルドガイド同様、ProMicroに部品が実装されていない面が上です。  

![img](../../_image/promicro01.jpg)  
![img](../../_image/promicro02.jpg)  

## 基板の裏と表について

　キースイッチが乗り、通常使用する際上を向く面を表、逆を裏とします。  
　Treadstone48の場合、ロゴとデザインの印刷の入ったほうが裏になります。  

## ダイオードをはんだ付けする

### ダイオードの脚を曲げる

　基板に付ける前にダイオードの脚を全部曲げてしまいます。基板の穴の間隔を見極めて曲げるための冶具を探してみてください。繋がったままの割りばしなどでも良いと思います。  

![img](../../_image/diode01.jpg)  

### ダイオードのはんだ付け

　ダイオードの取り付け向きは同じ方向なので、一つ確認して取り付けたら残りはすべて同じ方向で取り付けられます。ダイオードの黒や緑の帯側を基板のダイオード取り付け穴の四角いほうに向けて取り付けてください。  

![img](../../_image/diode02.png)  

　基板のウラ面からダイオードを差し込んでいきます。差し込んだらダイオードの足同士をネジって仮留めします。横一列ずつ差し込んでまとめてハンダ付けするとラクに速く出来ます。ハンダ付けしたら足を根元からカットしてください。  

## リセットスイッチをはんだ付けする

　リセットスイッチもウラ面に取り付けます。パチッとはめ込んで裏返してはんだ付けします。  

![img](_image/20181223-PC230006.jpg)  

![img](_image/20181216-PC160171.jpg)  

## トッププレートにスイッチをはめ込む

　ソケットをはんだ付けするためにレイアウトを決めます。  

![img](_image/keymap.png)  

　右下のmenuキーの個所は1.25Uのキーキャップを取り付けるか、右に寄せて1Uのキーキャップを取り付けるかの選択が出来ます。デフォルトキーマップには1.25Uをつけた場合を想定して「プロパティメニュー」キーが割り当てられています。  

　右上は2Uを1個か、1Uを2個取り付けるかの選択が出来ます。デフォルトキーマップには2Uが1個の時は「-」キー、1Uが2個の時は「-」キーと「Delete」キーが割り当てられています。  

![img](_image/20181216-PC160160.jpg)  
![img](_image/20181216-PC160161.jpg)  

## MXソケットをはんだ付けする

　まずトッププレートとPCBを合わせます。スイッチ裏の中央の出っ張りをPCBの穴に合わせて取り付けてください。  
　MXソケットをPCBのシルクの白いマークに合わせて取り付けます。スイッチのピンがMXソケットにちゃんと刺さっている事を確認しながらパチパチと全部付けてください。  
　こうすることでMXソケットが浮かずに確実にはんだ付け出来ます。  

　あとはハンダ付けです。MXソケットを取り付けると、スイッチの交換は可能になりますが、ソケットと基板の保持をハンダに頼っているため交換後スイッチが効かないなどのハンダ不良が発生する可能性があります。ただ厚く盛っても意味がないので、PCBとソケットの間にしっかりハンダを流します。  
　ハンダごてのこて先に気持ち多めにハンダを付けて、ソケットの金具の隙間に見えるPCBに付ける気持ちで、ソケットの隙間を少しこじ開ける感じで熱を与えながら流し込みます。  

## *(オプション)TRRSコネクタをはんだ付けする*

　rhymestone(販売自体は終了。基板データは公開中)と接続する場合はTRRSをウラ面に取り付けます。ラクにまっすぐ取り付けるため、マスキングテープでまっすぐつくように仮押さえしてから裏返してはんだ付けします。  

![img](_image/20181223-PC230005.jpg)  

## *(オプション)UnderglowLEDをはんだ付けする*

　写真のようにテープLEDの剥離紙の両端数cmだけハサミなどでカットします。これはテープLEDの背面の端子と、キーボード基板のスルーホールなどの端子が接触して動作不良を起こすことを防ぐ意味合いがあります。  

![img](../../_image/led_tape.jpg)  

　テープLEDは向きがありテープLEDの端子と基板の端子が合う向きにします。
![img](_image/20181223-PC230007.jpg)  

　Pro Microに近い一枚目はテープLED両端をはんだ付けする必要があるので、基板の両端のランドに少し被るくらいの位置にテープLEDを貼り付けてはんだ付けしてください。  

![img](_image/20181223-PC230008.jpg)  

　二枚目は片側だけですが、同じように向きに注意して貼り付けてはんだ付けしてください。  

## 保護パネルの取り付け

　Pro Micro周りの目隠しとOLEDを保護するためのプレートを取り付けます。8mmスペーサー2つをネジでPro Microの下にある穴に取り付けます。  
　プレートの保護紙を両方剥がして、ネジでPCBに付けたスペーサーに取り付けてください。  
　少し遊びがありますので、キーキャップを取り付けた時にキーキャップと干渉する場合は少しずらしてください。  

## *(オプション)OLED用のピンソケット・ピンヘッダをはんだ付けする*

　オモテ面に取り付けます。ラクにまっすぐ取り付けるため、マスキングテープでまっすぐつくように仮押さえしてから裏返してはんだ付けします。  

## *(オプション)OLEDの取り付け*

### OLED基板のカット

　Pro Micro直下に取り付けるスペーサーと、OLEDの基板が左右1mm x 3mmくらい干渉しますので、写真のようにカットしてください。左が加工後です。  
![img](../../_image/oled01.jpg)  

　スペーサーをゆるく仮止めしつつ現物合わせで削り込んでいってください。  
![img](_image/20181223-PC230004.jpg)  

## スペーサーの取り付け

　ボトムプレートの彫刻の入ってるの保護紙を剥がします。彫刻の細かい部分の保護紙はピンセットなどで剥がします。剥がした方にゴム脚を取り付けてください。標準でチルトするように大きいものと小さいものが入っていますので、小さいほう４つを手前に、大きいほう４つを奥に貼り付けてください。  

　残りの保護紙も剥がして、**7mm**スペーサー8つとネジを8つ使ってボトムプレートにねじ止めしてください。次にPCBの付いたマウントプレートを載せてネジ留めしてください。  

## キーキャップの取り付け

　お好みのキーキャップを取り付けてください。  

## テスト

　PCに接続して動作チェックしてください。[QMK Keytest](https://config.qmk.fm/#/test)やキーボードテスターアプリでキーが認識されているかチェックしてください。OLEDを取り付けている場合は、OLEDの四段目の表示がスイッチのステータスです。何かしら変化していればOKです。  

## 完成！

　チェックして問題なさそうなら完成です！あなただけの一台に仕上げてください！

![img](_image/20181220-PC200005.jpg)  

## キースイッチの交換方法

　手では取り外しにくいため、amazonなどで販売されているキースイッチ引き抜き工具を使用して交換してください。  

## *(オプション)Rhymestoneと組み合わせて使用する場合*

　Rhymestoneのどちらか片方をTreadstone48に接続してテンキーとして使用できるキーマップを用意しています。  
　デフォルトのキーマップではRhymestoneは左手側を接続するようにしていますが、右手側の切り替えも可能なようになっています。詳しくは[キーマップのreadmeを参照してください](https://github.com/marksard/qmk_firmware/blob/my_customize/keyboards/treadstone48/keymaps/like_jis_rs/readme_jp.md)  

## トラブルシューティング

[トラブルシューティング](../../troubleshooting.md)ページを参考にしてください。  
