[CmdletBinding()] 
param()

Set-StrictMode -Version Latest

gci env: | ForEach-Object {write-verbose ('{0}={1}' -f $_.Name,$_.Value)}

return @{'az' = 'response'} | convertto-json