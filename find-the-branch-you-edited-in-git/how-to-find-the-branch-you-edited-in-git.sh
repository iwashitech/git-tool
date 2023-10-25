# reflogが残っている場合のみ
git reflog show --all | grep $(git log --pretty=%H -S "SEARCH_WORD" --patch FILE_NAME | head -n1 | cut -c 1-9) | awk -F " " '{print $2}'

# ブランチ名は返さないがヒントとなるtagは返ってくる
git name-rev $(git log --pretty=%H -S "SEARCH_WORD" --patch FILE_NAME | head -n1)
git name-rev --name-only $(git log --pretty=%H -S "SEARCH_WORD" --patch FILE_NAME | head -n1)