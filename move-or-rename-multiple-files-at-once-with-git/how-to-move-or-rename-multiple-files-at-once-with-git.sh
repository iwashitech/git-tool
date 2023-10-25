# git - gitで複数のファイルを一括で移動またはリネームする方法を教えてください - スタック・オーバーフロー
# https://ja.stackoverflow.com/questions/190/git%e3%81%a7%e8%a4%87%e6%95%b0%e3%81%ae%e3%83%95%e3%82%a1%e3%82%a4%e3%83%ab%e3%82%92%e4%b8%80%e6%8b%ac%e3%81%a7%e7%a7%bb%e5%8b%95%e3%81%be%e3%81%9f%e3%81%af%e3%83%aa%e3%83%8d%e3%83%bc%e3%83%a0%e3%81%99%e3%82%8b%e6%96%b9%e6%b3%95%e3%82%92%e6%95%99%e3%81%88%e3%81%a6%e3%81%8f%e3%81%a0%e3%81%95%e3%81%84
# findコマンドで特定のディレクトリを検索対象から除外する | 晴耕雨読
# https://tex2e.github.io/blog/shell/find-not-path

for i in $(find . -iname "*.bat" -not -path "./git/*"); do
    git mv "$i" "bat/$i";
done