# come up with a better name for my system than 'computer'.

dep 'computer' do
  requires [
    'dropbox',
    'public key',
    'directories',
    'dotfiles',
    'cli tools',
    'dev dependencies',
    'apps',
  ]
end

dep 'directories' do
  requires 'create dirs', 'symlink org dir'
end

dep 'create dirs' do
  met? { '~/src'.p.exists? and '~/tmp'.p.exists? and '~/bin'.p.exists? }
  meet {
    shell 'mkdir -p ~/src'
    shell 'mkdir -p ~/tmp'
    shell 'mkdir -p ~/bin'
    log 'created ~/src, ~/tmp, ~/bin'
  }
end

dep 'symlink org dir' do
  met? { '~/org'.p.symlink? }
  meet { shell 'ln -s ~/Dropbox/org ~/org' }
end

dep 'cli tools' do
  requires [
    'ag.bin',
    'tree.bin',
    'xclip.bin',
    'stow.bin',
    'golang',
    'golang tools',
  ]
end

dep 'apps' do
  requires [
    'gimp.bin',
    'keepassx.bin',
  ]
end

dep 'dev dependencies' do
  requires 'python'
end

dep 'python' do
  requires [
    'python-pip.bin',
    'python-dev.lib',
    'libffi-dev.lib',
    'libssl-dev.lib',
  ]
end
