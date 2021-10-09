class OG_Pawn extends Rx_Pawn;

function StartSprint()
{
}

simulated function string GetCharacterClassName()
{
	local class<OG_FamilyInfo> fam;

	fam = class<OG_FamilyInfo>(GetFamilyInfo());

	return fam.default.Customname;
}

DefaultProperties
{
	AccelRate = 100000
	CameraLag = 0.00001
}