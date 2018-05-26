describe service("sonarr") do
  it { should be_enabled }
  it { should be_running }
end

sleep 5
describe port(8989) do
  it { should be_listening }
end
