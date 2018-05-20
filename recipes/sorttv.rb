include_recipe "media_server::media_user"

poise_archive node["media_server"]["sorttv"]["download_url"] do
  user node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
  destination "/home/#{node["media_server"]["media_user"]}/SortTV"
end

template "/home/#{node["media_server"]["media_user"]}/SortTV/sorttv.conf" do
  source node["media_server"]["sorttv"]["config_template_source"]
  user node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end
