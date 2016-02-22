dep 'firefox' do
  requires 'firefox.bin', 'firefox profile'
end

dep 'firefox profile' do
  requires 'firefox has been started', 'firefox has one profile'
  def profile
    cd '~/.mozilla/firefox' do
      default_profile = shell 'find . -maxdepth 1 -name \'*.default\''
      default_profile.p
    end
  end
  userjs = profile / 'user.js'

  met? { userjs.exists? }
  meet {
    data = <<-eos
user_pref("layout.css.devPixelsPerPx", "1.2"); // Bump up pixels for hi-res displays.
user_pref("ui.key.menuAccessKey", 0); // Don't show menu bar on "alt".'
eos
    File.write(userjs, data)
    log <<-eos
Install these addons:
https://addons.mozilla.org/en-us/firefox/addon/adwaita/
https://addons.mozilla.org/en-US/firefox/addon/htitle/
https://addons.mozilla.org/en-US/firefox/addon/disable-ctrl-q-shortcut/
https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
eos
  }
end

dep 'firefox has been started' do
  met? { '~/.mozilla/firefox'.p.exists? }
  meet {
    log 'Please start firefox and then press enter.'
    STDIN.gets
  }
end

dep 'firefox has one profile' do
  met? {
    cd '~/.mozilla/firefox' do
      num_profiles = shell 'find . -maxdepth 1 -name \'*.default\' | wc -l'
      num_profiles == '1'
    end
  }
end
