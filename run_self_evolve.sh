#!/bin/bash
# Strict isolation: only works inside ~/standalone

cd ~/standalone
export REPO_DIR="$HOME/standalone"
export MODEL="dolphin-mistral:7b"

# Ensure we're in the right repo
if [ ! -d "$REPO_DIR/.git" ]; then
    echo "❌ Not a git repo. Exiting."
    exit 1
fi

while true; do
    echo "🔄 Self-evolution cycle (isolated)..."
    # Use ollama to suggest code changes, but only within this repo
    PROMPT="Review the code in $REPO_DIR. Suggest one concrete improvement. Output only the diff or code change, no explanation."
    SUGGESTION=$(ollama run $MODEL "$PROMPT" 2>/dev/null)
    if [ -n "$SUGGESTION" ]; then
        echo "📝 Suggested change:"
        echo "$SUGGESTION"
        # Optional: apply automatically (uncomment with caution)
        # echo "$SUGGESTION" > "$REPO_DIR/suggested.patch"
        # (cd "$REPO_DIR" && patch -p1 < suggested.patch)
        # git add . && git commit -m "Auto-improvement" && git push
    fi
    sleep 3600
done
