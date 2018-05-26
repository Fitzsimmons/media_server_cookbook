chef_gem "ruby-shadow"

user node["media_server"]["media_user"] do
  home "/home/#{node["media_server"]["media_user"]}"
  shell "/bin/bash"

  password node["media_server"]["media_user_password"]

  manage_home true
end

group "sudo" do
  action :modify
  append true
  members node["media_server"]["media_user"]

  only_if { node["media_server"]["media_user_is_admin"] }
end

directory node["media_server"]["media_directory"] do
  recursive true
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end

directory "/home/#{node["media_server"]["media_user"]}/.ssh" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
  mode "0700"
end

file "/home/#{node["media_server"]["media_user"]}/.ssh/authorized_keys" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
  mode "0600"

  content node["media_server"]["media_user_pubkey"]

  not_if { node["media_server"]["media_user_pubkey"].nil? }
end
