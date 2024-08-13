# slurm_stats::login sets up a login node to print out slurm statistics on user login
class slurm_stats::login {

  file {'/etc/profile.d/zzz-slurm_stats.sh':
    source => 'puppet:///modules/slurm_stats/login_slurm_stats.sh',
    content => template('slurm_stats/login_slurm_stats.sh.erb'),
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
