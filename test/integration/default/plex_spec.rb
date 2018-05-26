describe service("plexmediaserver") do
  it { should be_enabled }
  it { should be_running }
end

describe port(32400) do
  it { should be_listening }
end

describe command("sudo -u plex bash -c 'echo modify > /mnt/media/justinf/TV/test.txt'") do
  its(:exit_status) { should eq(0) }
end

describe file("/mnt/media/justinf/TV/test.txt") do
  its(:content) { should match("modify") }
end
