include_recipe "ubuntu"
include_recipe "apt-periodic"

for package_name in node["media_server"]["misc_packages"] do
  package package_name
end
