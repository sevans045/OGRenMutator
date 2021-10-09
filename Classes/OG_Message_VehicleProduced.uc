class OG_Message_VehicleProduced extends Rx_Message_VehicleProduced;

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{	
	if (PC.GetTeamNum() == TEAM_GDI)
	{
			return default.GDIHarvesterAnnouncment;
	}
	else if (PC.GetTeamNum() == TEAM_NOD)
	{
		return default.NodHarvesterAnnouncment;
	}
}

DefaultProperties
{
	GDIHarvesterAnnouncment = SoundNodeWave'RenX_EvaSounds.gdi_unit_ready'
	NodHarvesterAnnouncment = SoundNodeWave'RenX_EvaSounds.nod_unit_ready'
}
