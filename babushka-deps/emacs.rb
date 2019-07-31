dep 'emacs' do
  requires ["stow.bin"]
  met? {
    '/usr/local/bin/emacs'.p.executable?
  }
  meet {
    log shell "cat ~/.babushka/deps/scripts/emacs.sh"
    shell "~/.babushka/deps/scripts/emacs.sh"
  }
end
