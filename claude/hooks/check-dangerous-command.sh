#!/bin/bash
# PreToolUse hook: 危険なBashコマンドを検出してブロックする
# Claude Codeがツールを実行する前にstdinでJSON入力を受け取る

# stdinからJSONを読み込む
INPUT=$(cat)

# コマンド文字列を抽出
COMMAND=$(echo "$INPUT" | python3 -c "
import json, sys
try:
    data = json.load(sys.stdin)
    cmd = data.get('tool_input', {}).get('command', '')
    print(cmd)
except Exception:
    print('')
" 2>/dev/null || echo "")

if [ -z "$COMMAND" ]; then
    exit 0
fi

# 破壊的操作のパターン一覧
DANGEROUS_PATTERNS=(
    "rm -rf"
    "rm -fr"
    "git push --force"
    "git push -f "
    "git push -f$"
    "git reset --hard"
    "git clean -f"
    "git clean -fd"
    "git branch -D"
    "chmod -R 777"
    "sudo rm"
    "pkill"
    "killall"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qE "$pattern"; then
        echo "⚠️  危険なコマンドが検出されました" >&2
        echo "" >&2
        echo "パターン : $pattern" >&2
        echo "コマンド : $COMMAND" >&2
        echo "" >&2
        echo "このコマンドを実行する場合は、ユーザーが明示的に承認してください。" >&2
        exit 2
    fi
done

exit 0
