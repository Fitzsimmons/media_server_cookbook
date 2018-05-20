describe service("jackett") do
  it { should be_enabled }
  it { should be_running }
end

describe port(9117) do
  it { should be_listening }
end
