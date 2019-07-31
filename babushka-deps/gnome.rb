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
  ]
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
