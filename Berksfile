source "https://supermarket.chef.io"

metadata

cookbook "terraform", git: "https://github.com/rosstimson/chef-terraform", ref: "34626fe79cf5e11edf058825ab0c894393e449f8"

group :integration do
  cookbook "media_server-test", path: "./test/fixtures/cookbooks/media_server-test"
end
