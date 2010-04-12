function watchdo ()
{
    command="$1"
    file="$2"
    while inotifywait -q $file; do
        $command $file;
    done
}

function lock ()
{
    xscreensaver-command -l &
}

function vgaoff ()
{
    xrandr --output VGA-0 --off
}

function vgaon ()
{
    xrandr --output VGA-0 --right-of LVDS --auto
}

function pmsusp ()
{
    gnome-power-cmd suspend 2&>/dev/null
}
