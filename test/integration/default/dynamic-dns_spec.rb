describe json("/var/lib/dynamic-dns/variables.tfvars.json") do
  its("aws_access_key") { should match "testaccess" }
  its("aws_secret_key") { should match "testsecret" }
  its("zone_id") { should match "testzone" }
  its("domain_name") { should match "testdomain" }
end

describe crontab("dynamic-dns") do
  its("minutes") { should cmp "*/5" }
  its("commands") { should cmp "/var/lib/dynamic-dns/apply.sh" }
end
