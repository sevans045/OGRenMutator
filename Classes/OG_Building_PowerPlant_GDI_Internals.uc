class OG_Building_PowerPlant_GDI_Internals extends Rx_Building_PowerPlant_GDI_Internals;

`include(OGRen\OGValues.uci);

function bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType)
{
    local int RealAmount;
    local float Scr;
    local int dmgLodLevel;
    local int repairableHealth;
    local int repairableMaxHealth;
    
    repairableHealth = Health;
    repairableMaxHealth = HealthMax;

    //Amount = Amount*2;
    if (repairableHealth > 0 && repairableHealth < repairableMaxHealth && Amount > 0 && (Healer == None || Healer.GetTeamNum() == GetTeamNum()) )
    {
        RealAmount = Min(Amount, repairableMaxHealth - repairableHealth);

        if (RealAmount > 0)
        {

            if (repairableHealth >= repairableMaxHealth && SavedDmg > 0.0f)
            {
                SavedDmg = FMax(0.0f, SavedDmg - Amount);
                Scr = SavedDmg * HealPointsScale;

                if(Healer != None)
                {
                    Rx_PRI(Healer.PlayerReplicationInfo).AddScoreToPlayerAndTeam(Scr);
                    Rx_PRI(Healer.PlayerReplicationInfo).AddRepairPoints_B(RealAmount); //Add to amount of Pawn repair points this 
                }
            }

            
            Scr = RealAmount * HealPointsScale;
            if(Healer != None)
            {
                Rx_PRI(Healer.PlayerReplicationInfo).AddScoreToPlayerAndTeam(Scr);
                Rx_PRI(Healer.PlayerReplicationInfo).AddRepairPoints_B(RealAmount); //Add to amount of Pawn repair points this 
            }
            
        }

        Health = Min(repairableMaxHealth, Health + Amount);
        repairableHealth = Health;
        
        if (Healer != None && repairableHealth >= repairableMaxHealth )
        {
            if (RealAmount > 0 && (WorldInfo.TimeSeconds - LastBuildingRepairedMessageTime > 10) && bCanPlayRepaired )
            {
                BroadcastLocalizedTeamMessage(GetTeamNum(),MessageClass,BuildingRepaired,Healer.PlayerReplicationInfo,,self);
                LastBuildingRepairedMessageTime = WorldInfo.TimeSeconds;
            }
            bCanPlayRepaired = false;
            BuildingVisuals.TriggerEventClass(Class'Rx_SeqEvent_BuildingEvent',Healer,4); 
        }

        dmgLodLevel = GetBuildingHealthLod();
        if(dmgLodLevel != DamageLodLevel) {
            DamageLodLevel = dmgLodLevel;
            ChangeDamageLodLevel(dmgLodLevel);
        }
        //bForceNetUpdate = True;

        BuildingVisuals.TriggerEventClass(Class'Rx_SeqEvent_BuildingEvent',Healer,1); 

        return True;
    }

    return False;
}

simulated function bool GetUseBuildingArmour(){return false;} //Stupid legacy function to determine if we use building armour when drawing. 

DefaultProperties
{
    /***************************************************/
    /*               Building Variables                */
    /***************************************************/   
    HDamagePointsScale      = `BUILDING_DMGPOINTS_SCALE

    HealPointsScale         = 0.04f
    Destroyed_Score         = `BUILDING_DESTROYED_SCORE // Total number of points divided out when  
    
    HealthMax               = `BUILDING_HP
    BA_HealthMax            = `BUILDING_HP //Slightly more health for building armour, but obviously with half of it being unrepairable. 
    LowHPWarnLevel          = 200 // critical Health level
    RepairedHPLevel         = 300 // 85%
	 
	FriendlyBuildingSounds(BuildingDestroyed)           = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_GDI_gdipowerplant_destroyed'
	FriendlyBuildingSounds(BuildingUnderAttack)         = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_GDI_gdipowerplant_underattack'
	FriendlyBuildingSounds(BuildingRepaired)            = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_GDI_gdipowerplant_repaired'
	FriendlyBuildingSounds(BuildingDestructionImminent) = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_GDI_gdipowerplant_destruction_imminent'
	EnemyBuildingSounds(BuildingDestroyed)              = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_Nod_gdipowerplant_destroyed'
	EnemyBuildingSounds(BuildingUnderAttack)            = SoundNodeWave'RenX_EvaSounds.PowerPlant_GDI.EVA_Nod_gdipowerplant_underattack'

}
