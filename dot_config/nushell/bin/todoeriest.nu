export def td [] {
    "find . -name "Todo.md" -exec cat {} + | rg \"\\- \\[[^X_]\\]\" | sort" | bash;
}
