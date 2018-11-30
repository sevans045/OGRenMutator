/*
* File: OG_Mutator
* Description: Replaces weapons & changes some default classes in Rx_Game.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Mutator extends Rx_Mutator;

function bool CheckReplacement(Actor Other)
{
	/** Advanced Engineers - Remotes can be detonated whenever and proxies are thrown **/
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

	/** Engineers - Remotes can be detonated whenever **/
	else if (Other.IsA('Rx_InventoryManager_GDI_Engineer'))
		Rx_InventoryManager_GDI_Engineer(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';

	else if (Other.IsA('Rx_InventoryManager_Nod_Engineer'))
		Rx_InventoryManager_Nod_Engineer(Other).PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';

	/** Snipers - Remove spread on sniper hip fire **/
	else if (Other.IsA('Rx_InventoryManager_GDI_Havoc'))
	{
		Rx_InventoryManager_GDI_Havoc(Other).PrimaryWeapons[0] = class'OG_Weapon_RamjetRifle';
		Rx_InventoryManager_GDI_Havoc(Other).AvailableAbilityWeapons[0] = None;
	}

	else if (Other.IsA('Rx_InventoryManager_Nod_Sakura'))
	{
		Rx_InventoryManager_Nod_Sakura(Other).PrimaryWeapons[0] = class'OG_Weapon_RamjetRifle';
		Rx_InventoryManager_Nod_Sakura(Other).AvailableAbilityWeapons[0] = None;
	}

	else if (Other.IsA('Rx_InventoryManager_GDI_Deadeye'))
	{
		Rx_InventoryManager_GDI_Deadeye(Other).PrimaryWeapons[0] = class'OG_Weapon_SniperRifle';
		Rx_InventoryManager_GDI_Deadeye(Other).AvailableAbilityWeapons[0] = None;
	}

	else if (Other.IsA('Rx_InventoryManager_Nod_BlackHandSniper'))
	{
		Rx_InventoryManager_Nod_BlackHandSniper(Other).PrimaryWeapons[0] = class'OG_Weapon_SniperRifle';
		Rx_InventoryManager_Nod_BlackHandSniper(Other).AvailableAbilityWeapons[0] = None;
	}

	/** Anti Tank - Remove charge time, piercing and EMP grenades **/
	else if (Other.IsA('Rx_InventoryManager_GDI_Sydney'))
	{
		Rx_InventoryManager_GDI_Sydney(Other).PrimaryWeapons[0] = class'OG_Weapon_PersonalIonCannon';
		Rx_InventoryManager_GDI_Sydney(Other).AvailableAbilityWeapons[0] = None;
	}

	else if (Other.IsA('Rx_InventoryManager_GDI_Gunner'))
		Rx_InventoryManager_GDI_Gunner(Other).AvailableAbilityWeapons[0] = None;

	else if (Other.IsA('Rx_InventoryManager_Nod_Raveshaw'))
	{
		Rx_InventoryManager_Nod_Raveshaw(Other).PrimaryWeapons[0] = class'OG_Weapon_Railgun';
		Rx_InventoryManager_Nod_Raveshaw(Other).AvailableAbilityWeapons[0] = None;
	}

	else if (Other.IsA('Rx_InventoryManager_Nod_LaserChainGunner'))
		Rx_InventoryManager_Nod_LaserChainGunner(Other).AvailableAbilityWeapons[0] = None;

	/** Misc. - Remove grenades **/
	else if (Other.IsA('Rx_InventoryManager_GDI_McFarland'))
		Rx_InventoryManager_GDI_McFarland(Other).AvailableAbilityWeapons[0] = None;

	else if (Other.IsA('Rx_InventoryManager_GDI_Officer'))
		Rx_InventoryManager_GDI_Officer(Other).AvailableAbilityWeapons[0] = None;

	else if (Other.IsA('Rx_InventoryManager_Nod_ChemicalTrooper'))
		Rx_InventoryManager_Nod_ChemicalTrooper(Other).AvailableAbilityWeapons[0] = None;

	else if (Other.IsA('Rx_InventoryManager_Nod_Officer'))
		Rx_InventoryManager_Nod_Officer(Other).AvailableAbilityWeapons[0] = None;

	else if(Other.IsA('Rx_TeamInfo'))
	{
		Rx_Game(WorldInfo.Game).PlayerControllerClass = class'OG_Controller';
		Rx_Game(WorldInfo.Game).PurchaseSystemClass = class 'OG_PurchaseSystem';
	}

	return true;
}