#!/run/current-system/sw/bin/nu
# Locks the device and suspends

export def locks [] {
    lock;
    systemctl suspend;
}

export def lock [] {

    let wallpaper_path = "/run/current-system/sw/share/wallpapers/system-wallpapers";

    # If the wallpapers dne at that path, just call regular and exit
    if ($wallpaper_path | path exists) == false {
        swaylock;
        return;
    } # Else we do got wallpapers

    # Pick a wallpaper at random from folder
    let wallpapers = ls $wallpaper_path;
    let chosen_wp_index = random int 0..($wallpapers | length);
    let chosen_wp_path = ($wallpapers | get $chosen_wp_index | get name);

    # Set that as the image for swaylock and exit
    swaylock -i $chosen_wp_path
    return;
}
