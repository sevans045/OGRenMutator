class OG_VehicleManager extends Rx_VehicleManager;

DefaultProperties
{
	ProductionDelay                 = 5.5f

	NodAdditionalAirdropProductionDelay = 0.0f // gets set once AS gets destroyed
	GDIAdditionalAirdropProductionDelay = 0.0f // gets set once WF gets destroyed

	MessageClass                    = class'OG_Message_VehicleProduced'
	NodHarvesterClass				= class'OG_Vehicle_Harvester_Nod'
	GDIHarvesterClass				= class'OG_Vehicle_Harvester_GDI'
}
