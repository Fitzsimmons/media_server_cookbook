include_recipe "media_server::media_user"

package "transmission-daemon"
package "transmission-remote-cli"
# package "zsh"

directory "/home/#{node["media_server"]["media_user"]}/.config" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end

directory "/home/#{node["media_server"]["media_user"]}/.config/transmission-daemon" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end

template "/home/#{node["media_server"]["media_user"]}/.config/transmission-daemon/settings.json" do
  source node["media_server"]["transmission"]["config_template_source"]
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end

poise_service "transmission-#{node["media_server"]["media_user"]}" do
  command "/usr/bin/transmission-daemon --foreground"
  user node["media_server"]["media_user"]
end
