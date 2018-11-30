/*
* File: OG_Vehicle_MRLS
* Description: Locks the MRLS turret.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Vehicle_MRLS extends Rx_Vehicle_MRLS;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	ChangeFireMode(true);
}

function bool DoJump(bool bUpdating)
{

}
