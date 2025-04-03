export def td [
    --path (-p): string # path to run starting from
] {

    "find . -name "Todo.md" -exec cat {} + | rg \"\\- \\[[^X_]\\]\" | sort" | bash;
}
