# EZ Plots fo' dat EZ muney.

## Config.

There are three configs.
 - chia
 - plotters
 - sync

### Chia config

This contains the environment config. This includes the path to the
chia-blockchain source, as well as ploting and remote sync configurations.

#### Format
    
    chia_source: path to the directory containing the chia-blockchain source
    chia_plotters: path to the plotter config file
    chia_sync: path to the plotter remote sync config file

### Plotter config

This contains the list of plots to manage. Each entry in the plotter config
will result in a plotter that runs until the target drive is out of space.

#### Format

The plotter config contains a list of CSV entries in the following format.

    <plot_name>,<plot_tmp_dir>,<plot_dst_dir>,<plot_threads(default: 5)>,<plot_max_memory(default: 7000)>

### Sync config

This contains the list of output directories to be sync'd remotely. This is
typically used if the output directory of the plot has limited space. These
plots will be copied remotedly, verified, then removed from the local output
directory.

#### Format

The sync config contains a list of CSV entries in the following format

    <local_dir>,<remote_location>,<ssh_key_path(default:~/.ssh/id_rsa)>,<ssh_user(default:1000)>

    ex: This would backup /mnt/disk/disk0/farm to the server 10.0.0.1 into the
      directory /mnt/disk/disk32/farm using the ssh key ~/.ssh/some_rsa and the
      username farmer.
    
    /mnt/disk/disk0/farm,10.0.0.1:/mnt/disk/disk32/farm,~/.ssh/some_rsa,farmer

## Scripts.

#### startplot
 Starts all the plots listed in the plotter config as well as the io monitor and the plot sync

#### stopplot 
 Stops all the plots listed in the plotter config. Does not stop the plot sync or the io monitor

#### stopsync
 Stops remote plot sync

#### stopmonitor
 Stops monitoring io stats

#### stopall 
 runs stopplot stopsync and stopmonitor



