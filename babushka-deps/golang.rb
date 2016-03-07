dep 'golang' do
  version = 'go1.5.2'
  met? {
    '~/go/bin/go'.p.executable? and
      not raw_shell('echo $GOPATH').stdout.strip.empty?
  }

  meet {
    Babushka::Resource.extract "https://storage.googleapis.com/golang/#{version}.linux-amd64.tar.gz" do |path|
      shell 'cp -r `pwd` ~/go'
    end
  }
end

meta :go do
  accepts_value_for :source

  template {
    requires 'golang'
    met? {
      (ENV['GOPATH'] / 'src' / source).exists?
    }

    meet {
      shell "go get #{source}"
    }
  }
end

dep 'golang tools' do
  requires [
    'goimports.go',
    'godef.go',
    'gocode.go',
    'hub',
  ]
end

dep 'hub' do
  source = "github.com/github/hub"
  met? {
    '~/bin/hub'.p.executable?
  }
  meet {
    log shell "go get -d #{source}"
    cd (ENV['GOPATH'] / 'src' / source) do
      log shell "./script/build -o ~/bin/hub"
    end
  }
end

dep 'goimports.go' do
  source 'golang.org/x/tools/cmd/goimports'
end

dep 'godef.go' do
  source 'github.com/rogpeppe/godef'
end

dep 'gocode.go' do
  source 'github.com/nsf/gocode'
end
