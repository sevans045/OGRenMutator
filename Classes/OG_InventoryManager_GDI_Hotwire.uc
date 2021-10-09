class OG_InventoryManager_GDI_Hotwire extends OG_InventoryManager_Adv_GDI;

function int GetPrimaryWeaponSlots() { return 3; }

DefaultProperties
{
	ExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
	AvailableExplosiveWeapons[0] = class'OG_Weapon_ProxyC4';
	PrimaryWeapons[1] = class'OG_Weapon_RemoteC4';

	PrimaryWeapons[0] = class'OG_Weapon_RepairGun_Advanced' //2
	
 	PrimaryWeapons[2] = class'Rx_Weapon_TimedC4_Multiple' //3
}
