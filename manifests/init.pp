# Configure python environment for system
class pythonenv(
  $versions = ['3.5.0', '2.7.10'],
  $default = '2.7.10 3.5.0',
) {
  include python

  python::version { $versions:
    require => Class['openssl']
  } ->
  class { 'python::global':
    version => $default
  }
}
