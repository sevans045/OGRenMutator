/*
* File: OG_Mutator
* Description: Replaces weapons.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Mutator extends Rx_Mutator;

function bool CheckReplacement(Actor Other)
{
	if (Other.IsA('Rx_InventoryManager_GDI_Hotwire'))
	{
		Rx_InventoryManager_GDI_Hotwire(Other).ExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
		Rx_InventoryManager_GDI_Hotwire(Other).AvailableExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
		Rx_InventoryManager_GDI_Hotwire(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';
	}

	else if (Other.IsA('Rx_InventoryManager_Nod_Technician'))
	{
		Rx_InventoryManager_Nod_Technician(Other).ExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
		Rx_InventoryManager_Nod_Technician(Other).AvailableExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
		Rx_InventoryManager_Nod_Technician(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';
	}

	else if (Other.IsA('Rx_InventoryManager_GDI_Engineer'))
	{
		Rx_InventoryManager_GDI_Engineer(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';
	}

	else if (Other.IsA('Rx_InventoryManager_Nod_Engineer'))
	{
		Rx_InventoryManager_Nod_Engineer(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';
	}

	return true;
}