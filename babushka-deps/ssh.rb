dep 'public key' do
  requires 'xclip.bin', 'keepassx.bin'
  met? { '~/.ssh/id_rsa.pub'.p.exists? }
  meet {
    log shell("ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -N ''")
    log "see ~/org/ssh.org for the websites you should add your new ssh key to, then press enter."
    STDIN.gets
  }
end
