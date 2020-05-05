[CmdletBinding()] 
param(    
    [string]
    $subscription,
    [string]
    $tenant
)

# # Set-StrictMode -Version Latest
# $VerbosePreference = continue
# Write-Verbose $subscription
# Write-Verbose $tenant
# gci env: | ForEach-Object {write-verbose ('{0}={1}' -f $_.Name,$_.Value)}

$azAccount = (az account show)| ConvertFrom-Json -AsHashtable
if ($azAccount)
{
    $loggedIn = (($azAccount.id -eq $subscription) -and ($azAccount.tenantId -eq $tenant))
}
else
{
    $loggedIn = "Null"
}
 return @{'az' = "$loggedIn"} | ConvertTo-Json