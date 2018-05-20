chef_gem "ruby-shadow"

user node["media_server"]["media_user"] do
  home "/home/#{node["media_server"]["media_user"]}"
  shell "/bin/bash"

  password node["media_server"]["media_user_password"]

  manage_home true
end


