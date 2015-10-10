# Configure python environment for system
class pythonenv(
  $versions = ['3.5.0', '2.7.10'],
  $default = '3.5.0',
) {
  include python

  python::version { $versions: }

  class { 'python::global':
    version => $default
  }
}
