default["apt"]["compile_time_update"] = true # needed because the terraform cookbook wants to pull in build-essential at compile time for some reason

default["media_server"]["misc_packages"] = [
  "ncdu",
  "quassel-core"
]

default["media_server"]["media_user"] = "justinf"
default["media_server"]["media_user_password"] = "$6$7uOKwtRU$LRfk3bnG..5kr9VDm09Z/WVlITwoi6vKeBFlDdHrhcD25At.ZMkm3NoFONW1U59p1OeaXb2mpB7oAnIIvSPVp0" #changeme
default["media_server"]["media_user_pubkey"] = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP4X/L6nItAXnXpm5HX4hhkBKQz23gOqSEQL0IZrlspV justinf@ghoul"

default["media_server"]["media_directory"] = "/mnt/media/justinf"
default["media_server"]["media_user_is_admin"] = true

default["media_server"]["allow_plex_to_delete_files"] = true

default["media_server"]["transmission"]["config_template_source"] = "transmission-daemon-settings.json.erb"

default["media_server"]["sorttv"]["download_url"] = "https://downloads.sourceforge.net/project/sorttv/SortTV1.37.zip"
default["media_server"]["sorttv"]["config_template_source"] = "sorttv.conf.erb"

default["media_server"]["dynamic_dns"]["data_bag_name"] = "dynamic_dns"

# fetch latest terraform release number from github api
terraform_metadata = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/hashicorp/terraform/releases/latest")))
default["terraform"]["version"] = terraform_metadata["tag_name"][1..-1] # cut off the "v" on the front of the tag

default["sonarr"]["settings"]["AnalyticsEnabled"] = "False"
