dep 'ag.bin' do
  installs 'silversearcher-ag'
end
dep 'apt-transport-https.lib'
dep 'ca-certificates.lib'
dep 'firefox.bin'
dep 'gimp.bin'
dep 'keepassx.bin'
dep 'libffi-dev.lib'
dep 'libssl-dev.lib'
dep 'python-dev.lib'
dep 'python-gpgme.lib'
dep 'python-pip.bin' do
  provides 'pip'
end
dep 'stow.bin' do
  after {
    stow_path = which('stow')
    sed_arg = '1 s|#!/usr/bin/perl$|#!/usr/bin/perl -X|'
    log_shell 'silence perl warnings', "sudo sed -i \'#{sed_arg}\' #{stow_path}"
  }
end
dep 'tree.bin'
dep 'vim.bin'
dep 'xclip.bin'
