define debian::alternatives::add($link, $path, $priority) {
  exec { "update-alternatives --install $link $name $path $priority":
    unless => "grep $path /var/lib/dpkg/alternatives/$name"
  }
}

define debian::alternatives::set($path) {
  exec { "update-alternatives --set $name $path":
    unless => "/bin/sh -c '[ -L /etc/alternatives/$name ] && [ /etc/alternatives/$name -ef $path ]'"
  }
}
