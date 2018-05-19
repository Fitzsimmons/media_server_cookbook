# media_server

A cookbook for provisioning all of the services I want on my home media server:

* [plex](https://www.plex.tv/)
* [sonarr](https://sonarr.tv/)
* [jackett](https://github.com/Jackett/Jackett)
* [transmission](https://transmissionbt.com/)
* [SortTV](https://sourceforge.net/projects/sorttv/)
* [Dynamic DNS](https://github.com/Fitzsimmons/terraform-route53-ddns-updater)

## Supported Platforms

### Tested And Validated On
- Ubuntu 18.04

## Usage

Make sure to look at [attributes/default.rb](attributes/default.rb) for customization options.

### media_server::default

Include `media_server::default` in your run_list to install all services

```json
{
  "run_list": [
    "recipe[media_server::default]"
  ]
}
```
