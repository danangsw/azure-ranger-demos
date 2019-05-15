#Get List custom roles
Get-AzRoleDefinition | FT Name, IsCustom

#The following example lists just the custom roles that are available for assignment in the selected subscription.
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name, IsCustom

#List a custom role definition
Get-AzRoleDefinition <role name> | ConvertTo-Json

#The following example lists just the actions of the role:
(Get-AzRoleDefinition <role name>).Actions

#Create a custom role with JSON template
New-AzRoleDefinition -InputFile "C:\CustomRoles\customrole1.json"

#Update a custom role
$role = Get-AzRoleDefinition "Virtual Machine Operator"
$role.Actions.Add("Microsoft.Insights/diagnosticSettings/*")
Set-AzRoleDefinition -Role $role

#Update a custom role with JSON template
Set-AzRoleDefinition -InputFile "C:\CustomRoles\customrole1.json"

#Delete a custom role
Get-AzRoleDefinition <role>
Get-AzRoleDefinition <role> | Remove-AzRoleDefinition