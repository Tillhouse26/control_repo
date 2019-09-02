class profile::user {
  user {'testuser':
    ensure             => 'present',
    comment            => 'Test User',
    groups             => ['wheel','testgrp'],
    shell              => '/bin/bash',
    uid                => 1105,
  }
}
