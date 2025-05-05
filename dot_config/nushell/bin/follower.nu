# A simple script to cd you to where the target of a symlink lives
export def --env follow [
    program: string
] {
    # Get initial paths for the symlink and it's target
    mut linkpath = (which $program | get 0.path | split row '/' | drop);
    mut targetpath = (ls -al (which $program | get path.0) | get 0.target | split row '/')

    # handle relative link ..
    while (($targetpath | get 0) == "..") {
        $linkpath = $linkpath | drop;
        $targetpath = $targetpath | drop nth 0 | drop;
    }

    # Create final path
    let finalpath = ($linkpath ++ $targetpath) | str join '/';

    # Debug
    #print ($linkpath);
    #print ($targetpath);
    #print $finalpath;

    # Actually cd me
    cd ($finalpath);

}
