dep 'dotfiles' do
  requires 'stow.bin'

  def dir
    '~/dotfiles'.p
  end
  met? {
    '~/dotfiles'.p.dir? and
      '~/.bashrc'.p.symlink?
  }

  meet {
    cd '~' do
      log_shell('clone dotfiles', 'git clone git@github.com:samertm/dotfiles') if not dir.exists?
      cd 'dotfiles' do
        shell './clean.sh'
        shell './install.sh'
      end
    end
  }
end
