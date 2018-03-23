# chocolatey-datadog-agent
Datadog Agent Package 

## Summary
This is the chocolatey install package for the Datadog Windows agent.

### Using the installer
***You must pass an APIKEY for the installer for this to work.***

The HOSTNAME and TAGS are optional.

#### Examples
>choco install chocolatey-datadog-agent --params "'/APIKEY:0cSOMELONGAPIKEY'"

Specify the hostname:
>choco install chocolatey-datadog-agent --params "'/APIKEY:0cSOMELONGAPIKEY /HOSTNAME:myhostname.foo.com'"

Specify the tags:
>choco install chocolatey-datadog-agent --params "'/APIKEY:0cSOMELONGAPIKEY /TAGS:production,webserver'"