dep 'emacs' do
  requires ["stow.bin"]
  met? {
    '/usr/local/bin/emacs'.p.executable?
  }
  meet {
    log shell "cat ./scripts/emacs.sh"
    shell "./scripts/emacs.sh"
  }
end
