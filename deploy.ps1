$subcriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$resourceGroupName = "rg-net-security-demo"
$location = "West Europe"

Set-AzContext -SubscriptionId $subcriptionId

if (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue) {
    Write-Host "Resource Group $resourceGroupName exists."
} else {
    Write-Host "Resource Group $resourceGroupName does not exist. Creating ..."
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

$resourceGroupDeployment = @{
    ResourceGroupName = $resourceGroupName
    TemplateFile = "base_infra.bicep"
    #TemplateParameterFile = "azuredeploy.parameters.json"
    DeploymentName = "$resourceGroupName-base-infra"
    Force = $true
}

New-AzResourceGroupDeployment @ResourceGroupDeployment
