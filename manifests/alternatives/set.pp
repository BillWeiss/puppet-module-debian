# == Define: debian::alternatives::set
#
# Selects an alternative for a generic command
#
# === Parameters
#
# [*namevar*]
#   $name is the generic command (i.e. 'editor') to add
#
# [*path*]
#   Filesystem path to the specific program to be used for this generic
#   (i.e. '/usr/bin/vim.nox')
#
# === Examples
#
#  debian::alternatives::set { 'editor':
#    path     => '/usr/bin/vim.nox',
#  }
#
# === Authors
#
# Eivind Uggedal <eivind@uggedal.com>
# Bill Weiss <github@billweiss.net>
#
# === Copyright
#
# No copyright or license supplied by the original author.  Modifications
# by Bill Weiss are licensed under the Apache 2 License.  If this is
# incompatible with the intended license of the original author, let's
# talk!
#
define debian::alternatives::set($path) {
  exec { "update-alternatives --set ${name} ${path}":
    path   => '/usr/sbin',
    unless => "/bin/sh -c '[ -L /etc/alternatives/${name} ] && [ /etc/alternatives/${name} -ef ${path} ]'"
  }
}
