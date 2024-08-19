# slurm_stats::data pulls the data
class slurm_stats::data (
  String  $data_store = '/slurm/etc/slurm',
  Integer $cronhour   = 2,
  Integer $cronmin    = 30,
){
  ensure_packages(['python3-numpy'], {'ensure' => present})

  file {'/usr/local/sbin/slurm_stats':
    content => template('slurm_stats/slurm_stats.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file {'/usr/local/sbin/job_summary':
    source  => 'puppet:///modules/slurm_stats/job_summary',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  cron { 'slurm_stats':
    command => '/usr/local/sbin/slurm_stats',
    user    => 'root',
    hour    => $cronhour,
    minute  => $cronmin,
  }
}
