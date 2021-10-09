class OG_Weapon_AutoRifle_GDI extends Rx_Weapon_AutoRifle_GDI;

DefaultProperties
{
	TeamSkin=MaterialInterface'RX_WP_AutoRifle.Materials.MI_WP_AR_GDI'
	TeamIndex = 1 

	AttachmentClass = class'Rx_Attachment_AutoRifle_GDI'

	WeaponProjectiles(0)=class'OG_Projectile_AutoRifle_GDI'
	WeaponProjectiles(1)=class'OG_Projectile_AutoRifle_GDI'

	//-------------- Recoil
	RecoilDelay = 0.02
	MinRecoil = 0.0						// 50.0			120
	MaxRecoil = 0.0						// 45.0			150
	MaxTotalRecoil = 0.0					// 1000.0
	RecoilYawModifier = 0.5 				// will be a random value between 0 and this value for every shot
	RecoilInterpSpeed = 15.0				// 37.0			50
	RecoilDeclinePct = 0.6
	RecoilDeclineSpeed = 6.0				// 4.0
	MaxSpread = 0.00						// 0.06			0.08
	RecoilSpreadIncreasePerShot = 0.0005	// 0.002		0.006
	RecoilSpreadDeclineSpeed = 0.2			// 0.1
	RecoilSpreadDecreaseDelay = 0.15
	RecoilSpreadCrosshairScaling = 1500;	// 2500

	Spread(0) = 0
	Spread(1) = 0

	bIronSightCapable = false

	FireInterval(0)=0.1
	FireInterval(1)=0
	ReloadTime(0) = 2.06
	ReloadTime(1) = 2.06

	EquipTime = 2

	ClipSize = 100
	InitalNumClips = 5
	MaxClips = 5
}
