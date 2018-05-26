chef_gem "ruby-shadow"

user node["media_server"]["media_user"] do
  home "/home/#{node["media_server"]["media_user"]}"
  shell "/bin/bash"

  password node["media_server"]["media_user_password"]

  manage_home true
end

directory node["media_server"]["media_directory"] do
  recursive true
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end
