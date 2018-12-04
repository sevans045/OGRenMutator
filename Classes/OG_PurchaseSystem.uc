/*
* File: OG_PurchaseSystem
* Description: Remove airstrikes and repair tools. Replace MRLS with OG_MRLS that has locked turrets
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_PurchaseSystem extends Rx_PurchaseSystem;

var array<class<Rx_Vehicle_PTInfo> > OGVehicleClasses;
var array<class<Rx_Vehicle_PTInfo> > OGNodVehicleClasses;

function bool Check()
{
	return true;
}

simulated function int GetVehiclePrices(byte teamID, int VehicleID, bool bViaAirdrop)
{
	local float Multiplier;

	Multiplier = 1.0;
	
	if (PowerPlants[teamID] != None && PowerPlants[teamID].IsDestroyed()) 
		Multiplier = 1.5; // if powerplant is dead then everything costs 1 and a half times as much
	
	if(bViaAirdrop)
		Multiplier *= 2.0;

	if (teamID == TEAM_GDI)
		return int(OGVehicleClasses[VehicleID].default.cost) * Multiplier;
	else
		return int(OGNodVehicleClasses[VehicleID].default.cost) * Multiplier;
}

simulated function class<Rx_Vehicle> GetVehicleClass(byte teamID, int VehicleID)
{
	if (teamID == TEAM_GDI)
		return OGVehicleClasses[VehicleID].default.VehicleClass;
	else
		return OGNodVehicleClasses[VehicleID].default.VehicleClass;
}

simulated function UpdateMapSpecificVehicleClasses()
{
	local Rx_MapInfo MI; 
	
	MI = Rx_MapInfo(WorldInfo.GetMapInfo());
	
	if (MI == None)
		return; 

	else
	{
		if (MI.bAircraftDisabled)
			return;

		else 
		{
			OGVehicleClasses[5] = None;
			OGVehicleClasses[6] = None;
	
			OGNodVehicleClasses[6] = None;
			OGNodVehicleClasses[7] = None;
		}
	}
}

function array<class<Rx_Vehicle_PTInfo> > VehiclesForTeam(byte TeamNum)
{
	if (TeamNum == TEAM_GDI)
		return OGVehicleClasses;
	else
		return OGNodVehicleClasses;
}

DefaultProperties
{
	GDIItemClasses[0] = class'Rx_Weapon_IonCannonBeacon'
	GDIItemClasses[1] = None
	GDIItemClasses[2] = None

	NodItemClasses[0] = class'Rx_Weapon_NukeBeacon'
	NodItemClasses[1] = None
	NodItemClasses[2] = None

	//replace the MRLS with OG_MRLS
	OGVehicleClasses[0] = class'RenX_Game.Rx_Vehicle_GDI_Humvee_PTInfo'
	OGVehicleClasses[1] = class'RenX_Game.Rx_Vehicle_GDI_APC_PTInfo'
	OGVehicleClasses[2] = class'OGRenMutator.OG_Vehicle_GDI_MRLS_PTInfo'
	OGVehicleClasses[3] = class'RenX_Game.Rx_Vehicle_GDI_MediumTank_PTInfo'
	OGVehicleClasses[4] = class'RenX_Game.Rx_Vehicle_GDI_MammothTank_PTInfo'
	OGVehicleClasses[5] = class'RenX_Game.Rx_Vehicle_GDI_Chinook_PTInfo'
	OGVehicleClasses[6] = class'RenX_Game.Rx_Vehicle_GDI_Orca_PTInfo'

	OGNodVehicleClasses[0] = class'RenX_Game.Rx_Vehicle_Nod_Buggy_PTInfo'
	OGNodVehicleClasses[1] = class'RenX_Game.Rx_Vehicle_Nod_APC_PTInfo'
	OGNodVehicleClasses[2] = class'RenX_Game.Rx_Vehicle_Nod_Artillery_PTInfo'
	OGNodVehicleClasses[3] = class'RenX_Game.Rx_Vehicle_Nod_FlameTank_PTInfo'
	OGNodVehicleClasses[4] = class'RenX_Game.Rx_Vehicle_Nod_LightTank_PTInfo'
	OGNodVehicleClasses[5] = class'RenX_Game.Rx_Vehicle_Nod_StealthTank_PTInfo'
	OGNodVehicleClasses[6] = class'RenX_Game.Rx_Vehicle_Nod_Chinook_PTInfo'
	OGNodVehicleClasses[7] = class'RenX_Game.Rx_Vehicle_Nod_Apache_PTInfo'
}