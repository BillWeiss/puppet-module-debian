# == Define: debian::alternatives::add
#
# Adds a new Debian alternative to the system
#
# === Parameters
#
# [*namevar*]
#   $name is the generic command (i.e. 'editor') to add
#
# [*link*]
#   Where the generic link lives (i.e. '/usr/bin/editor')
#
# [*path*]
#   Filesystem path to the specific program to be used for this generic
#   (i.e. '/usr/bin/vim.nox')
#
# [*priority*]
#   When an alternative is being automatically selected by the system, the
#   highest priority alternative is selected.  On a fairly stock Debian
#   wheezy system, the priorities for the 'editor' alternative were:
#    - /bin/nano - priority 40
#    - /usr/bin/vim.nox - priority 40
#    - /usr/bin/tiny - priority 10
#   If more than one alternative has the same priority, and that priority
#   is the highest, the manual states that the most-recently-added will be
#   selected
#
# === Examples
#
#  debian::alternatives::add { 'editor':
#    link     => '/usr/bin/editor',
#    path     => '/usr/bin/vim.nox',
#    priority => 40,
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
define debian::alternatives::add($link, $path, $priority) {
  exec { "update-alternatives --install ${link} ${name} ${path} ${priority}":
    path   => '/usr/sbin',
    unless => "grep ${path} /var/lib/dpkg/alternatives/${name}"
  }
}

