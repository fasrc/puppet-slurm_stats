# slurm_stats::login sets up a login node to print out slurm statistics on user login
class slurm_stats::login (
  String  $data_store = '/slurm/etc/slurm',
  String  $doc_url    = 'https://docs.rc.fas.harvard.edu/kb/slurm-stats',
  Integer $cronhour   = 1,
  Integer $cronmin    = 0,
){

  file {'/etc/profile.d/zzz-slurm_stats.sh':
    content => template('slurm_stats/zzz-slurm_stats.sh.erb'),
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file {'/usr/local/share/slurm_stats':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  cron { 'slurm_stats':
    command => "/usr/bin/cp -rf ${data_store}/slurm_stats* /usr/local/share/slurm_stats/.",
    user    => 'root',
    hour    => $cronhour,
    minute  => $cronmin,
  }
}
