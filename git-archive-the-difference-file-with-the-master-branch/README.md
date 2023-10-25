```bash
git archive --format=zip --prefix=識別子/ HEAD `git diff -w --diff-filter=d --name-only --no-merges master` -o ../識別子_archive.zip
```