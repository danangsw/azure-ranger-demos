#Create resource group
New-AzResourceGroup -Name myResourceGroup -Location EastUS

#Create new VM with default version of Windows Server 2016 Datacenter. 
New-AzVm -ResourceGroupName "myResourceGroup" -Name "myVM" -Location "EastUS" -VirtualNetworkName "myVnet" -SubnetName "mySubnet" -SecurityGroupName "myNSG" -PublicIpAddressName "myIP" -OpenPorts 80,3389
#Add password for login (demouser/Pass.1234567890)

#Connect to virtual machine
## Select Public IP
Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select "IpAddress"
## Connect RDP to VM
mstsc /v:<public ip>

#Install web server
#on CMD in the VM, run this command:
Install-WindowsFeature -name Web-Server -IncludeManagementTools
#View the web server in action, open browser and go to <public ip>

#Clean up resources 
Remove-AzResourceGroup -Name myResourceGroup

