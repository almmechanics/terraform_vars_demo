[CmdletBinding()] 
param(
    [string]
    $subscription,
    [string]
    $tenant
)

Set-StrictMode -Version Latest

# gci env: | ForEach-Object {write-verbose ('{0}={1}' -f $_.Name,$_.Value)}

$azAccount = (az account show)| ConvertFrom-Json -AsHashtable
$loggedIn = (($azAccount.id -eq $subscription) -and ($azAccount.tenantId -eq $tenant))

 return @{'az' = "$loggedIn"} | ConvertTo-Json