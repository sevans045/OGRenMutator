class OG_Vehicle_Artillery_Weapon extends Rx_Vehicle_Artillery_Weapon;

simulated function SetWeaponRecoil()
{
	super(Rx_Vehicle_Weapon_Reloadable).SetWeaponRecoil();	
}

simulated function ProcessViewRotation( float DeltaTime, out rotator out_ViewRotation, out Rotator out_DeltaRot )
{
	super(Rx_Vehicle_Weapon_Reloadable).ProcessViewRotation(DeltaTime, out_ViewRotation, out_DeltaRot);
}

DefaultProperties
{
    // reload config
    ClipSize = 1
    InitalNumClips = 999
    MaxClips = 999
    
    ShotCost(0)=1
    ShotCost(1)=1
     
    bReloadAfterEveryShot = true
    ReloadTime(0) = 1.5		// 1.5
    ReloadTime(1) = 1.5		// 1.5
    
	CloseRangeAimAdjustRange = 600   
	bCheckIfBarrelInsideWorldGeomBeforeFiring = true 
	
	/********************************/	
		
    // gun config
   FireTriggerTags(0)="MainGun"
   AltFireTriggerTags(0)="MainGun"
   VehicleClass=Class'RenX_Game.Rx_Vehicle_Artillery'

   FireInterval(0)=0.1
   FireInterval(1)=0.1

   Spread(0)=0.0025000
   Spread(1)=0.0025000
   
   bHasRecoil = true
   RecoilImpulse = -0.5f
 
   WeaponProjectiles(0) = Class'OG_Vehicle_Artillery_Projectile' 
   WeaponProjectiles(1) = Class'OG_Vehicle_Artillery_Projectile'
   
   //Heroic Modifiers
	WeaponProjectiles_Heroic(0)= Class'Rx_Vehicle_Artillery_Projectile_Arc_Heroic'
	WeaponProjectiles_Heroic(1)= Class'Rx_Vehicle_Artillery_Projectile_Arc_Heroic'
	
	WeaponFireSounds_Heroic(0)=SoundCue'RX_VH_Artillery.Sounds.Arty_FireCue_Heroic'
	WeaponFireSounds_Heroic(1)=SoundCue'RX_VH_Artillery.Sounds.Arty_FireCue_Heroic'
   
   WeaponDistantFireSnd=SoundCue'RX_SoundEffects.Cannons.SC_Cannon_DistantFire'

   // CrosshairMIC = MaterialInstanceConstant'RenX_AssetBase.UI.MI_Reticle_Tank_Artillery'
   CrosshairMIC = MaterialInstanceConstant'RenX_AssetBase.UI.MI_Reticle_Tank_Type5A'
   
//	CrosshairWidth = 512
//	CrosshairHeight = 512
   
    // AI
   bRecommendSplashDamage=True
   
   FM0_ROFTurnover = 2; //9 for most automatics. Single shot weapons should be more, except the shotgun

    bOkAgainstLightVehicles = True
	bOkAgainstArmoredVehicles = True
	bOkAgainstBuildings = True
}
