class OG_HUD_TargetingBox extends Rx_HUD_TargetingBox;

function UpdateTargetHealthPercent ()
{
	TargetArmorPercent = 0;
	bHasArmor = false;
	
	/*Get interface armour/health pcts*/
	if(TargetedActor.GetShouldShowHealth())
	{
		TargetHealthPercent = TargetedActor.GetTargetHealthPct(); 
		TargetArmorPercent = TargetedActor.GetTargetArmourPct(); //float(Rx_Pawn(TargetedActor).Armor) / max(1,float(Rx_Pawn(TargetedActor).HealthMax + Rx_Pawn(TargetedActor).ArmorMax)); 
		TargetHealthMaxPercent = TargetedActor.GetTargetMaxHealthPct(); //float(Rx_Pawn(TargetedActor).HealthMax) / max(1,float(Rx_Pawn(TargetedActor).HealthMax + Rx_Pawn(TargetedActor).ArmorMax)); 
	}	
}