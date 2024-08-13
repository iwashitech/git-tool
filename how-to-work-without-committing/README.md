# コミットせずに追加、修正したファイルを抽出する方法

## statusを使う方法

```sh
# tar
git status --short | awk -F" " '{print $2}' | tar Tzcf - working.tgz
mkdir work
tar -xzf working.tgz -C work

# zip
# sudo apt install zip unzip
git status -u --short | awk -F" " '{print $2}' | xargs zip working.zip
unzip working.zip -d work
```

## 参考サイト

- [Windowsネイティブな環境でのtar.gzファイルの解凍](https://rcmdnk.com/blog/2021/09/17/computer-windows/)
- [git archive with unstaged changes - Stack Overflow](https://stackoverflow.com/questions/23115777/git-archive-with-unstaged-changes)
- [version control - How can I run "git status" and just get the filenames - Stack Overflow](https://stackoverflow.com/questions/5237605/how-can-i-run-git-status-and-just-get-the-filenames)
- [Linuxコマンド【 tar 】アーカイブの作成・展開 - Linux入門 - Webkaru](https://webkaru.net/linux/tar-command/)
- [tarでファイル解凍先ディレクトリを指定したい - ITmedia エンタープライズ](https://www.itmedia.co.jp/help/tips/linux/l0418.html)

---

## stashを使う方法

```sh
git stash -u
git stash show 'stash@{0}' -p --binary > patch
git apply patch
```

## 参考サイト

- [git - Export a stash to another computer - Stack Overflow](https://stackoverflow.com/questions/3973034/export-a-stash-to-another-computer)
- [how to do an export for git stash - Stack Overflow](https://stackoverflow.com/questions/47183452/how-to-do-an-export-for-git-stash)
- [In git, is there a way to show untracked stashed files without applying the stash? - Stack Overflow](https://stackoverflow.com/questions/12681529/in-git-is-there-a-way-to-show-untracked-stashed-files-without-applying-the-stas#:~:text=Stash%20entries%20can%20be%20made,as%20part%20of%20the%20diff.)
- [git cannot apply binary patch *** without full index line - Stack Overflow](https://stackoverflow.com/questions/17152171/git-cannot-apply-binary-patch-without-full-index-line)
- [how to view untracked files that were "git stash -u" - Stack Overflow](https://stackoverflow.com/questions/52357450/how-to-view-untracked-files-that-were-git-stash-u)
- [How to see untracked files in Git stashes - Stack Overflow](https://stackoverflow.com/questions/60218116/how-to-see-untracked-files-in-git-stashes)
- [git stash can't apply untracked file - Stack Overflow](https://stackoverflow.com/questions/71060732/git-stash-cant-apply-untracked-file)
