# slurm_stats::login sets up a login node to print out slurm statistics on user login
class slurm_stats::login {

  file {'/etc/profile.d/zzz-slurm_stats.sh':
    source => 'puppet:///module/slurm_stats/login_slurm_stats.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}