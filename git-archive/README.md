# git archive

## 使用方法
```
git archive foo-bar --format=zip -o archive_`date '+%Y%m%d_%H%M%S'`.zip --prefix=foo-bar/ `git diff --name-only --diff-filter=d 123456 789456`
```

## エラーが出た場合
```bash
git archive cannot-git-archive `git diff --name-only --diff-filter=d 123456 789456| sed 'files_to_exclude.txt'` --format=zip -o archive.zip --prefix=cannot-archive/
```

## オプション
```
--format=<fmt>
結果のアーカイブの形式。
可能な値は、tar、zip、tar.gz、tgz、および構成オプション tar.<format>.command を使用して定義された任意の形式です。
--format が指定されておらず、出力ファイルが指定されている場合、
形式は可能であればファイル名から推測されます (たとえば、foo.zip に書き込むと、出力がzip形式になります)。
それ以外の場合、出力形式はtarです。

-l
--list
使用可能なすべての形式を表示します。

-v
--verbose
進行状況を stderr に報告します。

--prefix=<prefix>/
<prefix>/をアーカイブ内のパスに追加します。
繰り返すことができます。
その右端の値がすべての追跡ファイルに使用されます。
--add-fileと--add-virtual-fileで使用される値は以下を参照してください。

-o <file>
--output=<file>
アーカイブをstdoutではなく<file>に書き込みます。

--add-file=<file>
追跡されていないファイルをアーカイブに追加します。
複数のファイルを追加するために繰り返すことができます。
アーカイブ内のファイルのパスは、この--add-fileの前の最後の--prefixオプション(存在する場合)の値と
<file>のベース名を連結することによって構築されます。

--add-virtual-file=<path>:<content>
指定されたコンテンツをアーカイブに追加します。
複数のファイルを追加するために繰り返すことができます。
アーカイブ内のファイルのパスは、最後の--prefixオプション(存在する場合)の値を、
この--add-virtual-fileと<path>の前に連結することによって構築されます。

--remote=<repo>
ローカルリポジトリからtarアーカイブを作成する代わりに、リモートリポジトリからtarアーカイブを取得します。
リモートリポジトリでは、<tree-ish>で許可されるsha1式に制限が設けられる場合があることに注意してください。
詳細については、git-upload-archive[1]を参照してください。
```

## git diff
### オプション
--diff-filter

||変更内容|
|-|-|
|A|追加|
|C|コピー|
|M|修正|
|R|リネーム|
|D|削除|

## 参考サイト

### git archive
- [Git - git-archive Documentation](https://git-scm.com/docs/git-archive)
- [git コマンドで差分納品 zipを作る (かつ、不要ファイルは含めないようにしたい) ｜ Tips Note by TAM](https://www.tam-tam.co.jp/tipsnote/program/post12992.html)
- [Githubのdiffとarchiveで差分ファイル一覧を抽出する](https://zenn.dev/ymmt1089/articles/20221010_git_archive)
- [Gitで差分ファイルを抽出+zipファイル化する方法 | 株式会社グランフェアズ](https://www.granfairs.com/blog/staff/git-archivediff)
- [[Git]masterと作業ブランチの差分ファイルを抽出してzip化する | いまからむったーん](https://muttaan.com/git-diffextraction/)

### git diff
- [git-diff – Git コマンドリファレンス（日本語版）](https://tracpath.com/docs/git-diff/)

### Initial commitとの差分を取得
- [Git で最初のコミットも含むすべての差分を取得する方法 | gotohayato.com](https://gotohayato.com/content/219/)
- [version control - How to get Git diff of the first commit? - Stack Overflow](https://stackoverflow.com/questions/40883798/how-to-get-git-diff-of-the-first-commit)

### if / case
- [シェルスクリプト（bash）のif文やwhile文で使う演算子について - Qiita](https://qiita.com/egawa_kun/items/196cd354c0d8e4e0fefc)
- [Bashのif文でANDやOR条件、&&や||演算子を使う | 晴耕雨読](https://tex2e.github.io/blog/shell/bash-and-or)
- [【シェルスクリプト】キーボードからの入力を受け付ける方法 | server-memo.net](https://www.server-memo.net/shellscript/key_read.html#i-5)
- [シェルで変数の空文字判定 - ハックノート](https://hacknote.jp/archives/32292/)
- [シェルスクリプトに挑戦しよう（9）制御構文［その2］――caseによる条件分岐：“応用力”をつけるためのLinux再入門（29）（2/2 ページ） - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1811/21/news009_2.html)

### テキストの改行
- [【簡単】シェルスクリプトでテキストを改行する方法](https://eng-entrance.com/linux-shellscript-newline)
- [bashのヒアドキュメントを活用する - Qiita](https://qiita.com/take4s5i/items/e207cee4fb04385a9952)
- [bash - How to preserve leading spaces whern reading from a here-document with read? - Stack Overflow](https://stackoverflow.com/questions/66373229/how-to-preserve-leading-spaces-whern-reading-from-a-here-document-with-read)

### 文字列を配列に変換
- [How to split a string into an array in Bash? - Stack Overflow](https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash)

### awk
- [awkの-Fオプションで区切り文字を指定する方法 | ITを使っていこう](https://it-ojisan.tokyo/awk-f/)
- [awkでcsvファイルを処理する | ITを使っていこう](https://it-ojisan.tokyo/awk-csv/)
- [シェルのawk内で定義した変数や結果をAwk外で取り扱いたい](https://teratail.com/questions/38693)
- [awk とシェルとの値の受け渡しについて - Qiita](https://qiita.com/shotets/items/b9ebf936b4152ea12aa1)
- [awkで切り出した２つのデータを変数に代入 -awkの初歩的な質問をさせて- UNIX・Linux | 教えて!goo](https://oshiete.goo.ne.jp/qa/10671098.html)