dep 'public key' do
  met? { '~/.ssh/id_rsa.pub'.p.exists? }
  meet {
    log shell("ssh-keygen -t rsa -b 4096")
    log "see ~/org/ssh.org for the websites you should add your new ssh key to."
  }
end
