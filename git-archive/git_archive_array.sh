WORK_DATE=`date '+%Y%m%d_%H%M%S'`
WORK_DIR=__git_archive_work_temp
REQUEST_INPUT="
######################################################

ブランチ名、--diff-filter、git diffの左側、右側の順に
（※--diff-filterを空にした場合はdを設定します）
カンマ区切りで入力してください: 

######################################################
"

if [ ! -e $WORK_DIR ]; then
  mkdir $WORK_DIR
fi

IFS=, read -a INPUT -p "$REQUEST_INPUT"
branch_name=${INPUT[0]}
diff_filter=${INPUT[1]}
diff_left=${INPUT[2]}
diff_right=${INPUT[3]}

if [ -e $WORK_DIR/input.txt ]; then
CONFIRM_USE_TXT="
######################################################

下記の入力を使用しますか？(y/n): 
`tail -1 $WORK_DIR/input.txt`

######################################################
"
fi

if ( [ ${#INPUT[@]} -eq 0 ] ) || ( [ -z "$branch_name" ] && [ -z "$diff_filter" ] && [ -z "$diff_left" ] && [ -z "$diff_right" ] ); then
  echo "何も入力されていません"
  if [ -e $WORK_DIR/input.txt ]; then
    read -p "$CONFIRM_USE_TXT" USE_INPUT_TXT
    case "$USE_INPUT_TXT" in
      y)
        IFS=',' read -r -a input_txt <<< `tail -1 $WORK_DIR/input.txt`
        branch_name=${input_txt[0]}
        diff_filter=${input_txt[1]}
        diff_left=${input_txt[2]}
        diff_right=${input_txt[3]}
        ;;
      n)
        exit 0
        ;;
      *)
        exit 0
        ;;
    esac
  fi
else
  echo "$branch_name,$diff_filter,$diff_left,$diff_right" >> $WORK_DIR/input.txt
fi

if [ -z "$diff_filter" ]; then
  diff_filter=d
fi

GIT_DIFF="git diff --name-only --diff-filter=$diff_filter $diff_left $diff_right"
CMD_FOR_ECHO="git archive $branch_name --format=zip -o $WORK_DIR/archive_$WORK_DATE.zip --prefix=$branch_name/ \`$GIT_DIFF\`"

CONFIRM_TEXT="
############################################################################################################

下記のコマンドを実行します。よろしいですか？(y/n): 
$CMD_FOR_ECHO

############################################################################################################
"

LOG_TEXT=$(cat << EOS
# git archiveの詳細

## アーカイブするファイル一覧
\`\`\`
`$GIT_DIFF | tr ' ' '¥n'`
\`\`\`

## git archiveコマンド
\`\`\`bash
$CMD_FOR_ECHO
\`\`\`

### ブランチ
\`\`\`
$branch_name
\`\`\`

### diff内容
\`\`\`
$diff_left $diff_right
\`\`\`

### --diff-filter
\`\`\`
$diff_filter
\`\`\`
EOS
)

read -p "$CONFIRM_TEXT" CONFIRM
case "$CONFIRM" in
  y)
    if [ -n "`$GIT_DIFF`" ]; then
      git archive $branch_name --format=zip -o $WORK_DIR/archive_$WORK_DATE.zip --prefix=$branch_name/ `$GIT_DIFF`
      printf '%s\n' "$LOG_TEXT" > $WORK_DIR/git_archive_$WORK_DATE.md
    else
      echo "git diffの実行結果は空です"
      echo "git archiveを実行しませんでした"
    fi
    ;;
  n)
    exit 0
    ;;
  *)
    exit 0
    ;;
esac
