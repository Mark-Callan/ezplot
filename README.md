# EZ Plots fo' dat EZ muney.

Just cause its jank, don't mean it ain't dank.

## Config.

There are three configs.
 - environment
 - plotters
 - syncsrc
 - syncdst

### Environment config

This contains the environment config. This includes the path to the
chia-blockchain source, as well as plotting and remote sync configurations.


### Plotter config

This contains the list of plots to manage. Each entry in the plotter config
will result in a plotter that runs until the target drive is out of space.

#### Format

The plotter config contains a list of CSV entries in the following format.

    <plot_name>,<plot_tmp_dir>,<plot_dst_dir>,<plot_threads(default: 5)>,<plot_max_memory(default: 7000)>

### Sync config

The sync config is simple. It's a CSV with two columns. Source directory,
and destination directory. The source is the directory that contains the plots to be sync'd.
The destination is the IP of another machine that has ezplot installed. For each plot,
we ssh to the target machine, use `ezplot plotdst` to select the best destination for the
plot, and we then rsync that file to the remote machine.

#### format

    <local_plot_dir>,<remote_ip>

## Gettings started

If you just run ezplot with no args it will print the list of commands. But basically,
you just set your config files at ~/.local/opt/chia/config/, and use

    ezplot start

To start plotting, and then

    ezplot stop

To stop plotting. Note that you need to manually stop the monitoring, sync'ing,
and rebalancing tmux sessions as those don't get stopped automatically.
