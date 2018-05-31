include_recipe "ubuntu"
include_recipe "apt-periodic"

node["media_server"]["misc_packages"].each do |package_name|
  package package_name
end
