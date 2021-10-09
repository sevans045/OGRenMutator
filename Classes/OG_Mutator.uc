class OG_Mutator extends Rx_Mutator;

/** We use this function to replace a lot of different things, instead of overwriting their classes **/
function bool CheckReplacement(Actor Other)
{	
	/** Obelisk - Remove charge hold time **/
	if (Other.IsA('Rx_Sentinel_Obelisk_Laser_Base'))
		Rx_Sentinel_Obelisk_Laser_Base(Other).DefaultWeaponClass = class'OG_SentinelWeapon_Obelisk';

	else if (Rx_PRI(Other) != None)
		Rx_PRI(Other).DisableVeterancy(true);

	return true;
}

// Replaces internals
event PreBeginPlay()
{
	local Rx_Building Building;
	local class<Rx_Building_Internals> NewInternals;

	super.PreBeginPlay();

	ForEach WorldInfo.AllActors(class'Rx_Building', Building)
	{
		NewInternals = class<Rx_Building_Internals>(DynamicLoadObject(Repl(string(Building.BuildingInternalsClass.Name), "Rx_", "OGRen.OG_", false), class'Class'));

		if (NewInternals != None)
			Building.BuildingInternalsClass = NewInternals;
	}
}
