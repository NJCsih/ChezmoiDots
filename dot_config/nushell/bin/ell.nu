# Quick wrapper for ls which handles selecting and finding on the results
# I'm so bad at nu I found a bug https://github.com/nushell/nushell/issues/15300

export def l [
    path: string = ".",
    --sel (-s): list<string> = [name type mode size modified],
    --find (-f): string, # sorting/highlighting
    --table (-t)
    --reverse (-r)
    --recursive (-R)
] {
    (if ($recursive != true) {
        ls -al ($path | path expand)
    } else {
        ls -al ...(glob (($path | path expand ) + "/**"))
    })
        | select ...$sel
        | (if ($find != null) { find $find } else { })
        | (if ($reverse) { reverse } else {  })
        | (if ($table) { } else { table -i false -t light })
}
