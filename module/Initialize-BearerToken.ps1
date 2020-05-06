# set-strictmode -version latest

[CmdletBinding()] 
param(
    [string]
    [ValidateNotNullOrEmpty()]
    $Location,
    [string]
    [ValidateNotNullOrEmpty()]
    $ResourceID,
    [string]
    [ValidateNotNullOrEmpty()]
    $DatabricksAccessToken,
    [string]
    [ValidateNotNullOrEmpty()]
    $ManagementAccessToken
   
)
$tokens = @(invoke-restmethod -Headers @{'Authorization'='Bearer {0}'-f $DatabricksAccessToken; 'X-Databricks-Azure-SP-Management-Token'=('{0}'-f $ManagementAccessToken) ; 'X-Databricks-Azure-Workspace-Resource-Id'=$ResourceID} -uri ('https://{0}.azuredatabricks.net/api/2.0/token/list' -f $Location) -method Get).token_infos

# Only generate if none exist
if ($tokens.count -eq 0)
{
    (invoke-restmethod -Headers @{'Authorization'='Bearer {0}'-f $DatabricksAccessToken; 'X-Databricks-Azure-SP-Management-Token'=('{0}'-f $ManagementAccessToken) ; 'X-Databricks-Azure-Workspace-Resource-Id'=$ResourceID} -uri ('https://{0}.azuredatabricks.net/api/2.0/token/create' -f $Location) -method post).token_value
}

return @{} | ConvertTo-Json