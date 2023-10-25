# gitでマージコミット以外の自分の行ったコミットしたファイルを得る方法

```sh
git log --no-merges --name-only --format="" --author="author-name" COMMIT_ID_START..COMMIT_ID_END
```

## 参考サイト
- [diff - Show non-merge differences for two commits in git - Stack Overflow](https://stackoverflow.com/questions/4549157/show-non-merge-differences-for-two-commits-in-git#answer-4549206)
- [github - How to get ONLY filename with path using git log? - Stack Overflow](https://stackoverflow.com/questions/33080793/how-to-get-only-filename-with-path-using-git-log#answer-33083272)
- [version control - How can I view a git log of just one user's commits? - Stack Overflow](https://stackoverflow.com/questions/4259996/how-can-i-view-a-git-log-of-just-one-users-commits#answer-4262780)