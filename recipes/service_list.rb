package "nginx-full"

template "/var/www/html/index.html" do
  source "service_list.html.erb"
end

file "/var/www/html/index.nginx-debian.html" do
  action :delete
end
