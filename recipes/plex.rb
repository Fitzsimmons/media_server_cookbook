include_recipe "plex"

include_recipe "media_server::media_user"

execute "allow plex to delete files" do
  command "setfacl --recursive --default --modify u:plex:rwX '#{node["media_server"]["media_directory"]}'"
  only_if { node["media_server"]["allow_plex_to_delete_files"] }
end
