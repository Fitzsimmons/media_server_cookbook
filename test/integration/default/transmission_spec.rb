describe service("transmission-justinf") do
  it { should be_enabled }
  it { should be_running }
end

describe port(9091) do
  it { should be_listening }
end
