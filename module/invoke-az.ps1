[CmdletBinding()] 
param(    
    [string]
    $Subscription,
    [string]
    $Tenant,
    [string]
    $ClientId,
    [string]
    $ClientSecret
)

# # Set-StrictMode -Version Latest
# $VerbosePreference = continue
# Write-Verbose $subscription
# Write-Verbose $tenant
# gci env: | ForEach-Object {write-verbose ('{0}={1}' -f $_.Name,$_.Value)}

$azAccount = (az account show)| ConvertFrom-Json -AsHashtable
if ($azAccount)
{
    $Response = (($azAccount.id -eq $Subscription) -and ($azAccount.tenantId -eq $Tenant))
}
else
{
    az login --service-principal -u $ClientId -p $ClientSecret --tenant $Tenant

    $Response= ((az account get-access-token)| ConvertFrom-Json).accessToken
    
}
 return @{'az' = "$Response"} | ConvertTo-Json