directory "#{node["media_server"]["media_directory"]}/TV" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
end

file "#{node["media_server"]["media_directory"]}/TV/test.txt" do
  owner node["media_server"]["media_user"]
  group node["media_server"]["media_user"]
  content "hello."
end

