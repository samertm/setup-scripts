dep 'node' do
  version = 'v0.12.9'
  name = "node-#{version}"
  tar_name = "#{name}-linux-x64"
  stow_path = "/usr/local/stow/#{name}"

  met? {
    stow_path.p.exists? and
      '/usr/local/bin/node'.p.executable? and
      '/usr/local/bin/npm'.p.executable?
  }

  meet {
    Babushka::Resource.extract "https://nodejs.org/download/release/#{version}/#{tar_name}.tar.gz" do |path|
      shell "sudo mkdir -p #{stow_path}"
      shell "sudo cp -r * #{stow_path}"
      cd "/usr/local/stow" do
        shell "sudo stow #{name}"
      end
    end
  }
end
