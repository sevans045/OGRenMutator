/*
* File: OG_PurchaseSystem
* Description: Remove airstrikes and repair tools.
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
}