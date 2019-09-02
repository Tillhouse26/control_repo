class profile::user {
  user {'testuser':
    ensure             => 'present',
    comment            => 'Test User',
    gid                => 1100,
    groups             => ['wheel','testgrp'],
    shell              => '/bin/bash',
    uid                => 1105,
  }
}
