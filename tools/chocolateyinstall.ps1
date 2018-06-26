$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Get Params passed in from the command line
$packageParams = Get-PackageParameters

# cannot install without and APIKEY
if (!$packageParams['APIKEY']) { throw "Need to supply an API key!"}

# download location
$url        = '' # download url, HTTPS preferred
$url64      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-6.3.0.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  softwareName  = 'Datadog Agent' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = ''
  checksumType   = 'sha256'
  checksum64     = 'ef95edec395120aff2cce34a7eb309759f5da70d5233bdaef0f402c8da419a76'
  checksumType64 = $checksumType
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" APIKEY=`"$($packageParams['APIKEY'])`" HOSTNAME=`"$($packageParams['HOSTNAME'])`" TAGS=`"$($packageParams['TAGS'])`" " # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs