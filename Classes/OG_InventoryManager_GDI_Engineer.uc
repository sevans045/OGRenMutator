class OG_InventoryManager_GDI_Engineer extends OG_InventoryManager_Basic;

function int GetPrimaryWeaponSlots() { return 2; }

DefaultProperties
{
	PrimaryWeapons[0] = class'OG_Weapon_RepairGun'
	PrimaryWeapons[1] = class'OG_Weapon_RemoteC4' 
}
