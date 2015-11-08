# Configure python environment for system
class pythonenv(
  $versions = ['2.7.10', '3.5.0'],
  $default = ['2.7.10', '3.5.0'],
) {
  include python

  python::version { $versions:
    require => Class['openssl']
  } ->
  class { 'python::global':
    version => $default
  }
}
