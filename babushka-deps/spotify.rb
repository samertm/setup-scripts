dep 'spotify.bin' do
  requires 'spotify sources', 'libgcrypt11.lib'
  installs 'spotify-client'
end

dep 'spotify sources' do
  met? {
    shell? "grep '^deb http://repository.spotify.com' /etc/apt/sources.list"
  }

  meet {
    shell 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886'
    shell 'sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"'
    shell 'sudo apt-get update'
    log 'added spotify sources'
  }
end

dep 'libgcrypt11.lib' do
  meet {
    Babushka::Resource.get 'https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb' do |path|
      shell "sudo dpkg -i #{path}"
    end
  }
end
