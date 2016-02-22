dep 'docker' do
  requires 'docker.bin'
  requires [
    'set docker user',
    'set docker bridge ip',
  ]
end

dep 'docker.bin' do
  requires 'docker sources', 'linux-image-extra.lib'
  installs 'docker-engine'
end

dep 'set docker user' do
  user = shell('whoami')
  met? {
    shell? "groups #{user} | grep docker"
  }
  meet {
    shell "sudo usermod -aG docker #{user}"
  }
end

dep 'set docker bridge ip' do
  requires 'brctl.bin'
  conf = '/etc/systemd/system/docker.service.d/docker.conf'
  met? { conf.p.exists? }
  meet {
    shell 'sudo mkdir -p /etc/systemd/system/docker.service.d'
    data = <<-eos
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd:// --bip=192.168.169.1/24
eos
    shell "sudo sh -c \'cat > #{conf} <<EOF
#{data}
EOF\'"
    shell "sudo systemctl daemon-reload"
    shell "sudo systemctl stop docker"
    shell "sudo ip link set docker0 down"
    shell "sudo brctl delbr docker0"
    shell "sudo systemctl start docker"
  }
end

dep 'brctl.bin' do
  installs 'bridge-utils'
end

dep 'linux-image-extra.lib' do
  kernel = shell 'uname -r'
  installs "linux-image-extra-#{kernel}"
end

dep 'docker sources' do
  met? {
    '/etc/apt/sources.list.d/docker.list'.p.exists? and
      shell? 'grep "^deb https://apt.dockerproject.org/repo" /etc/apt/sources.list.d/docker.list'
  }

  meet {
    shell 'sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
    shell 'sudo sh -c \'echo "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release -sc) main" > "/etc/apt/sources.list.d/docker.list"\''
    shell 'sudo apt-get update'
  }
end
