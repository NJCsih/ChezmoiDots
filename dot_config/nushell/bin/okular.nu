# Quick wrapper for ls which handles selecting and finding on the results
# I'm so bad at nu I found a bug https://github.com/nushell/nushell/issues/15300

export def ok [
    path: string
] {
    job spawn { okular ...( glob ( $path | path expand ) ) }
}
