dep 'gnome' do
  requires 'gsettings'
end

dep 'ubuntu-gnome-desktop.lib'

dep 'gsettings' do
  requires [
    'turn off bell.gsettings',
    'show the date.gsettings',
    'set time format to 12 hour.gsettings',
    'set capslock to ctrl.gsettings',
    'drag with alt.gsettings',
    'alt tab switches windows',
  ]
end

dep 'alt tab switches windows' do
  requires [
    'fix switch applications.gsettings',
    'fix switch applications backwards.gsettings',
    'fix switch windows.gsettings',
    'fix switch windows backwards.gsettings',
  ]
end

dep 'fix switch applications.gsettings' do
  schema 'org.gnome.desktop.wm.keybindings'
  key 'switch-applications'
  value "['<Super>Tab']"
end

dep 'fix switch applications backwards.gsettings' do
  schema 'org.gnome.desktop.wm.keybindings'
  key 'switch-applications-backward'
  value "['<Shift><Super>Tab']"
end

dep 'fix switch windows.gsettings' do
  schema 'org.gnome.desktop.wm.keybindings'
  key 'switch-windows'
  value "['<Alt>Tab']"
end

dep 'fix switch windows backwards.gsettings' do
  schema 'org.gnome.desktop.wm.keybindings'
  key 'switch-windows-backward'
  value "['<Shift><Alt>Tab']"
end

dep 'drag with alt.gsettings' do
  schema 'org.gnome.desktop.wm.preferences'
  key 'mouse-button-modifier'
  value "'<Alt>'"
end

dep 'turn off bell.gsettings' do
  schema 'org.gnome.desktop.wm.preferences'
  key 'audible-bell'
  value false
end

dep 'show the date.gsettings' do
  schema 'org.gnome.desktop.interface'
  key 'clock-show-date'
  value true
end

dep 'set time format to 12 hour.gsettings' do
  schema 'org.gnome.desktop.interface'
  key 'clock-format'
  value '12h'
end

dep 'set capslock to ctrl.gsettings' do
  schema 'org.gnome.desktop.input-sources'
  key 'xkb-options'
  value "['ctrl:nocaps']"
end

meta 'gsettings' do
  accepts_value_for :schema
  accepts_value_for :key
  accepts_value_for :value
  template {
    met? {
      v = shell("gsettings get #{schema} #{key}")
      v == value.to_s or v == "'#{value}'"
    }
    meet {
      shell "gsettings set #{schema} #{key} \"#{value}\""
    }
  }
end
