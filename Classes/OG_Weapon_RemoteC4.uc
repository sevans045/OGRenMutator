/*
* File: OG_Weapon_RemoteC4
* Description: Allow Remote C4s to detonate as soon as they're thrown.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Weapon_RemoteC4 extends Rx_Weapon_RemoteC4;

reliable server function ServerDetonateRemotes()
{
	if (Remotes.Length > 0)
		DetonateCharges();	

	bDetonatedRemotes = true;
	
	if (!HasAnyAmmo())
		super.WeaponEmpty();
}

DefaultProperties
{
	CustomWeaponName = "Remote C4"
}