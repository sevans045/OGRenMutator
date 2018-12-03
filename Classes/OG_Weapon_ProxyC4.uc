/*
* File: OG_Weapon_ProxyC4
* Description: Allow Proxy C4s to be thrown.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Weapon_ProxyC4 extends Rx_Weapon_Deployable;

simulated function PerformRefill()
{
	CurrentAmmoInClip = default.ClipSize;
	AmmoCount = MaxAmmoCount;
}

function bool Deploy()
{
	local Rx_Controller IPC;
	
	IPC = Rx_Controller(Instigator.Controller);
	
	if (!Rx_PRI(IPC.PlayerReplicationInfo).bCanMine) /*Nobody likes you; you can't use these things that have been badly designed for 12+ years now.*/
	{	
		IPC.CTextMessage("You are currently banned from mining");
		return false;
	}
	
	if (super.Deploy())
	{
		destroyOldMinesIfMinelimitReached();
		Rx_TeamInfo(Rx_Game(WorldInfo.Game).Teams[Instigator.GetTeamNum()]).mineCount++;
		return true;
	}

	return false;
}

DefaultProperties
{
	DeployedActorClass=class'OG_Weapon_DeployedProxyC4'

	// Weapon SkeletalMesh
	Begin Object class=AnimNodeSequence Name=MeshSequenceA
	End Object

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'rx_wp_proxyc4.Mesh.SK_WP_ProxyC4_1P'
		AnimSets(0)=AnimSet'rx_wp_proxyc4.Anims.AS_WP_ProxyC4_1P'
		Animations=MeshSequenceA
		Scale=2.0
		FOV=50.0
	End Object
	
	ArmsAnimSet = AnimSet'rx_wp_proxyc4.Anims.AS_WP_ProxyC4_Arms'

	AttachmentClass = class'Rx_Attachment_ProxyC4'
	
	PlayerViewOffset=(X=10.0,Y=0.0,Z=-2.5)
	FireOffset=(X=25,Y=0,Z=-5)
	
	//-------------- Recoil
	RecoilDelay = 0.07
	RecoilSpreadDecreaseDelay = 0.1
	MinRecoil = -100.0
	MaxRecoil = -50.0
	MaxTotalRecoil = 1000.0
	RecoilYawModifier = 0.5 // will be a random value between 0 and this value for every shot
	RecoilInterpSpeed = 10.0
	RecoilDeclinePct = 0.5
	RecoilDeclineSpeed = 2.0
	RecoilSpread = 0.0
	MaxSpread = 0.0
	RecoilSpreadIncreasePerShot = 0.015
	RecoilSpreadDeclineSpeed = 0.25

	ShotCost(0)=1
	ShotCost(1)=0
	FireInterval(0)=+0.75
	FireInterval(1)=+0.0
	
	EquipTime=0.6
	
	ClipSize = 1
	InitalNumClips = 3
	MaxClips = 3

	WeaponFireTypes(0)=EWFT_Custom
	WeaponFireTypes(1)=EWFT_None

    Spread(0)=0.0
	Spread(1)=0.0
	
	ThirdPersonWeaponPutDownAnim="H_M_C4_PutDown"
	ThirdPersonWeaponEquipAnim="H_M_C4_Equip"

	ReloadAnimName(0) = "weaponreload"
	ReloadAnimName(1) = "weaponreload"
	ReloadAnim3PName(0) = "H_M_C4_Equip"
	ReloadAnim3PName(1) = "H_M_C4_Equip"
	ReloadArmAnimName(0) = "weaponreload"
	ReloadArmAnimName(1) = "weaponreload"
	
	WeaponFireSnd[0]=SoundCue'RX_WP_TimedC4.Sounds.SC_TimedC4_Fire'
	WeaponFireSnd[1]=None

	WeaponPutDownSnd=SoundCue'RX_WP_TimedC4.Sounds.SC_TimedC4_PutDown'
	WeaponEquipSnd=SoundCue'RX_WP_TimedC4.Sounds.SC_TimedC4_Equip'
	ReloadSound(0)=SoundCue'RX_WP_TimedC4.Sounds.SC_TimedC4_Equip'
	ReloadSound(1)=SoundCue'RX_WP_TimedC4.Sounds.SC_TimedC4_Equip'

	PickupSound=SoundCue'RX_WP_Shotgun.Sounds.SC_Shotgun_Equip'
 
	MuzzleFlashSocket=MuzzleFlashSocket
	FireSocket=MuzzleFlashSocket

	CrosshairMIC = MaterialInstanceConstant'RenXHud.MI_Reticle_AutoRifle'

	InventoryGroup=5
	GroupWeight=1
	InventoryMovieGroup=25

	WeaponIconTexture=Texture2D'rx_wp_proxyc4.UI.T_WeaponIcon_ProximityC4'

	//DroppedPickupClass = class'RxDroppedPickup_AutoRifle'

	
	// AI Hints:
	//MaxDesireability=0.7
	AIRating=+0.3
	CurrentRating=+0.3
	bFastRepeater=false
	bInstantHit=false
	bSplashJump=false
	bRecommendSplashDamage=true
	bSniping=false

	/** one1: Added. */
	BackWeaponAttachmentClass = class'Rx_BackWeaponAttachment_ProxyC4'

	CustomWeaponName = "Proximity C4"
}
