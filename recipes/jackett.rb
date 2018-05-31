package "libcurl4-openssl-dev"
package "mono-devel"

poise_service_user "jackett" do
  home "/var/lib/jackett"
end

directory "/var/lib/jackett" do
  owner "jackett"
  group "jackett"
end

poise_archive "jackett" do
  # find latest release via github api
  metadata = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/Jackett/Jackett/releases/latest")))

  path metadata["assets"].find { |x| x["name"] == "Jackett.Binaries.Mono.tar.gz" }["browser_download_url"]
  destination "/var/lib/jackett"
  owner "jackett"
  group "jackett"
end

poise_service "jackett" do
  user "jackett"
  command "/usr/bin/mono --debug /var/lib/jackett/JackettConsole.exe --NoRestart"
end

node.normal["media_server"]["advertised_services"]["Jackett"] = "9117"
