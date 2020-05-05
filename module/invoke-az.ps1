[CmdletBinding()] 
param()

Set-StrictMode -Version Latest

# gci env: | ForEach-Object {write-verbose ('{0}={1}' -f $_.Name,$_.Value)}
$azReply = (az version) | ConvertFrom-Json -AsHashtable


 return @{'az' = $azReply['azure-cli']} | ConvertTo-Json