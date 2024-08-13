# slurm_stats::data pulls the data
class slurm_stats::data (
  String $data_store = '/slurm/etc/slurm',
){

  file {'/usr/local/sbin/slurm_stats_fairshare':
    content => template('slurm_stats/slurm_stats_fairshare.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
