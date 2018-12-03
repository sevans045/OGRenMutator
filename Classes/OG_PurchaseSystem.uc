/*
* File: OG_PurchaseSystem
* Description: Remove airstrikes and repair tools. Replace MRLS with OG_MRLS that has locked turrets
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_PurchaseSystem extends Rx_PurchaseSystem;

function bool Check()
{
	return true;
}

DefaultProperties
{
	GDIItemClasses[0]  = class'Rx_Weapon_IonCannonBeacon'
	GDIItemClasses[1]  = None
	GDIItemClasses[2]  = None

	NodItemClasses[0]  = class'Rx_Weapon_NukeBeacon'
	NodItemClasses[1]  = None
	NodItemClasses[2]  = None


	//replace the MRLS with OG_MRLS
	GDIVehicleClasses[2]   = class'OG_Vehicle_GDI_MRLS_PTInfo'
}