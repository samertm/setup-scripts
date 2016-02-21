dep 'dropbox' do
  requires 'dropbox.bin'
  met? {
    '~/Dropbox'.p.exists? and
      '~/Dropbox/org'.p.exists?
  }

  meet {
    log "log into Dropbox, wait for it to start the initial sync, and press enter."
    STDIN.gets
  }
end

dep 'dropbox.bin' do
  requires 'dropbox sources', 'python-gpgme.lib'
end

 do
  installs 'python-gpgme'
end

dep 'dropbox sources' do
  met? {
    shell? "grep '^deb http://linux.dropbox.com' /etc/apt/sources.list"
  }

  meet {
    shell 'sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E'
    shell 'sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"'
    shell 'sudo apt-get update'
    log "added dropbox to apt sources"
  }
end
