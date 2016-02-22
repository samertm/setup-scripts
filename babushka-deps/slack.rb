dep 'slack.bin' do
  meet {
    log 'Download and install Slack, then press enter: https://slack.com/downloads'
    STDIN.gets
  }
end
