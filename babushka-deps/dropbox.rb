dep 'dropbox' do
  met? {
    '~/Dropbox'.p.exists? and
      '~/Dropbox/org'.p.exists?
  }

  meet {
    log "log into Dropbox, wait for it to start the initial sync, and press enter."
    STDIN.gets
  }
end
