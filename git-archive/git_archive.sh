WORK_DATE=`date '+%Y%m%d_%H%M%S'`

while :
do
  read -p "ブランチ名: " branch_name
  if [ -n "$branch_name" ]; then
    echo "=>"$branch_name
    break
  else
    echo "ブランチ名を入力してください"
  fi
done

while :
do
  read -p "--diff-filter: " diff_filter
  case "$diff_filter" in
    [AaCcMmRrDd]*)
      echo "=>"$diff_filter
      break
      ;;
    *)
      echo "=>d"
      break
      ;;
  esac
done

while :
do
  read -p "git diffの左側: " diff_left
  if [ -n "$diff_left" ]; then
    echo "=>"$diff_left
    break
  else
    echo "git diffの左側を入力してください"
  fi
done

while :
do
  read -p "git diffの右側: " diff_right
  if [ -n "$diff_right" ]; then
    echo "=>"$diff_right
    break
  else
    echo "git diffの左側を入力してください"
  fi
done

GIT_DIFF="git diff --name-only --diff-filter=$diff_filter $diff_left $diff_right"
CMD_FOR_ECHO="git archive $branch_name --format=zip -o archive_$WORK_DATE.zip --prefix=$branch_name/ $GIT_DIFF"

CONFIRM_TEXT="
############################################################################################################

下記のコマンドを実行します。よろしいですか？(y/n): 
$CMD_FOR_ECHO

############################################################################################################
"

read -p "$CONFIRM_TEXT" CONFIRM
case "$CONFIRM" in
  y)
    if [ -n "`$GIT_DIFF`" ]; then
      git archive $branch_name --format=zip -o archive_$WORK_DATE.zip --prefix=$branch_name/ `$GIT_DIFF`
      echo $CMD_FOR_ECHO > git_archive_$WORK_DATE.log
    else
      echo "git diffの実行結果は空です"
      echo "git archiveを実行しませんでした"
    fi
    ;;
  n*)
    exit 0
    ;;
esac
