# see https://www.yubico.com/faq/enable-u2f-linux/

dep 'yubi' do
  conf = '/etc/udev/rules.d/70-u2f.rules'
  met? {
    conf.p.exists?
  }

  meet {
    data = <<-eos
# this udev file should be used with udev 188 and newer
ACTION!="add|change", GOTO="u2f_end"

# Yubico YubiKey
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0113|0114|0115|0116|0120|0402|0403|0406|0407|0410", TAG+="uaccess"

LABEL="u2f_end"
eos
    shell "sudo sh -c \'cat > #{conf} <<EOF
#{data}
EOF\'"
  }
end
