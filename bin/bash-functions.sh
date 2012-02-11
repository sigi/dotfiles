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
    xrandr --output DFP1 --off
}

function vgaon ()
{
    xrandr --output DFP1 --right-of LVDS --auto
}

function pmsusp ()
{
    gnome-power-cmd suspend 2&>/dev/null
}

function rvm_prompt ()
{
  if [ -n "$rvm_bin_path" ]; then
    rvm_prompt_output=`$rvm_bin_path/rvm-prompt i v p g`
    if [ -n "$rvm_prompt_output" ]; then
      printf "[%s] " $rvm_prompt_output
    fi
  fi
}

