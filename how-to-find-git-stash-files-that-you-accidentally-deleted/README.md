# git stashで間違って消してしまったファイルを見つける

```sh
# Merge: 123456 abcdefで見つかった
git fsck --unreachable | grep commit | cut -d ' ' -f3 | xargs git log --merges --no-walk --grep=WIP
```

## 参考サイト
- [How to undo git stash clear - Stack Overflow](https://stackoverflow.com/questions/32517870/how-to-undo-git-stash-clear)