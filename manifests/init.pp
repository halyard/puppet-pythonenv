# Configure python environment for system
class pythonenv(
  $versions = ['2.7.10', '3.5.0'],
  $default = ['2.7.10', '3.5.0'],
) {
  $modules = hiera_array('pythonenv::modules', [])

  include python

  python::version { $versions:
    require => Class['openssl']
  } ->
  class { 'python::global':
    version => $default
  }

  $modules.each |$module| {
    python::package { $module:
      python => $versions
    }
  }

  $system_pips = [
    '/usr/local/bin/pip',
    '/usr/local/bin/pip2',
    '/usr/local/bin/pip2.7'
  ]
  file { $system_pips:
    ensure => absent
  }
}
