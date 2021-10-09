class OG_Weapon_RepairGun extends Rx_Weapon_RepairGun;

simulated function RepairBuilding(Rx_Building building, float DeltaTime)
{
	local int repairableHealth;
	local int maxRepairableHealth;
	
	repairableHealth = building.GetHealth();
	maxRepairableHealth = building.GetMaxHealth();
	
	if (!IsEnemy(building) &&
		!building.IsDestroyed() &&
		Rx_Building_Techbuilding(building) == none && // Do not repair tech building exteriors
		repairableHealth < maxRepairableHealth) 
	{
		Repair(building,DeltaTime);
	}
	else
	{
		if(building.isA('Rx_CapturableMCT')
				&& !(building.ScriptGetTeamNum() == Instigator.GetTeamNum() && building.GetHealth() >= building.GetMaxHealth()) )
			Repair(building,DeltaTime);
		else
			bHealing = false;
	}
}

simulated function RepairBuildingAttachment(Rx_BuildingAttachment buildingAttachment, float DeltaTime)
{
	local int repairableHealth;
	local int maxRepairableHealth;	
	
	repairableHealth = buildingAttachment.OwnerBuilding.BuildingVisuals.GetHealth();
	maxRepairableHealth = buildingAttachment.OwnerBuilding.BuildingVisuals.GetMaxHealth();	
	
	// Is a tech building MCT
	if (Rx_BuildingAttachment_MCT(buildingAttachment) != None && Rx_Building_TechBuilding_Internals(buildingAttachment.OwnerBuilding) != None &&
		!(Rx_BuildingAttachment_MCT(buildingAttachment).ScriptGetTeamNum() == Instigator.GetTeamNum() && buildingAttachment.OwnerBuilding.GetHealth() >= buildingAttachment.OwnerBuilding.GetMaxHealth() ) )
	{
		Repair(buildingAttachment,DeltaTime);
	}
	else if (!IsEnemy(buildingAttachment) && !buildingAttachment.OwnerBuilding.IsDestroyed() 
				&& repairableHealth < maxRepairableHealth) 
	{
		Repair(buildingAttachment,DeltaTime);
	}
	else
	{
		bHealing = false;
	}
}

DefaultProperties
{
	HealAmount = 20
}