include_recipe "terraform"

poise_service_user "dynamic-dns" do
  home "/var/lib/dynamic-dns"
end

directory "/var/lib/dynamic-dns" do
  owner "dynamic-dns"
  group "dynamic-dns"
end

# have to manually grab the file and slap a .tar.gz extension on it so that poise_archive knows what kind of archive it is
remote_file "#{Chef::Config[:file_cache_path]}/terraform-route53-ddns-updater.tar.gz" do
  # find latest release via github api
  metadata = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/fitzsimmons/terraform-route53-ddns-updater/releases/latest")))
  source metadata["tarball_url"]
end

poise_archive "terraform-route53-ddns-updater" do
  path "#{Chef::Config[:file_cache_path]}/terraform-route53-ddns-updater.tar.gz"
  destination "/var/lib/dynamic-dns"
  owner "dynamic-dns"
  group "dynamic-dns"
end

file "/var/lib/dynamic-dns/variables.tfvars.json" do
  tfvars_bag = data_bag_item(node["media_server"]["dynamic_dns"]["data_bag_name"], "tfvars")
  tfvars = tfvars_bag.raw_data.to_hash.select do |k, v|
    %w(aws_access_key aws_secret_key zone_id domain_name).include?(k)
  end

  content JSON.pretty_generate(tfvars)
  owner "dynamic-dns"
  group "dynamic-dns"
end

cron "update dynamic dns" do
  minute "*/5"
  command "/var/lib/dynamic-dns/apply.sh"
  user "dynamic-dns"
end
