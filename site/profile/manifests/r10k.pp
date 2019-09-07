class profile::r10k {
  class {'r10k':
    remote => 'ssh://git@qhlv012p.health.qld.gov.au:24/mhr-ops/control-repo',
  }
  class {'r10k::webhook::config':
    use_mcollective => false,
    enable_ssl      => false,
  }
  class {'r10k::webhook':
    user  => 'root',
    group => 'root',
  }
}
