include_recipe "media_server::media_user"
include_recipe "media_server::packages"
include_recipe "media_server::jackett"
include_recipe "media_server::plex"
include_recipe "sonarr"
service "sonarr" do
  action :enable # community cookbook doesn't do this itself for some reason
end
include_recipe "media_server::transmission"
include_recipe "media_server::sorttv"
include_recipe "media_server::dynamic_dns"
