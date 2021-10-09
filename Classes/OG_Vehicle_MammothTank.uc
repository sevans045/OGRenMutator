
class OG_Vehicle_MammothTank extends Rx_Vehicle_MammothTank
placeable;

simulated function vector GetEffectLocation(int SeatIndex)
{

    local vector SocketLocation;
   local name FireTriggerTag;

    if ( Seats[SeatIndex].GunSocket.Length <= 0 )
        return Location;

   //`Log("GetEffectLocation called",, '_Mammoth_Debug');

   FireTriggerTag = Seats[SeatIndex].GunSocket[GetBarrelIndex(SeatIndex)];

   Mesh.GetSocketWorldLocationAndRotation(FireTriggerTag, SocketLocation);

    //if (Weapon.CurrentFireMode == 0)
    //   ShotCount = ShotCounts >= 255 ? 0 : ShotCounts + 1;
   //  else
   //     AltShotCounts = AltShotCounts >= 255 ? 0 : AltShotCounts + 1;
    return SocketLocation;
}

// special for mammoth
simulated event GetBarrelLocationAndRotation(int SeatIndex, out vector SocketLocation, optional out rotator SocketRotation)
{
   //`Log("GetBarrelLocationAndRotation called",, '_Mammoth_Debug');
    if (Seats[SeatIndex].GunSocket.Length > 0)
    {
        Mesh.GetSocketWorldLocationAndRotation(Seats[SeatIndex].GunSocket[GetBarrelIndex(SeatIndex)], SocketLocation, SocketRotation);
    }
    else
    {
        SocketLocation = Location;
        SocketRotation = Rotation;
    }
}

simulated function int GetBarrelIndex(int SeatIndex)
{
   local int OldBarrelIndex;
   //`Log("GetBarrelIndex called",, '_Mammoth_Debug');
   OldBarrelIndex = super.GetBarrelIndex(SeatIndex);
   if (Weapon == none)
      return OldBarrelIndex;

   return (Weapon.CurrentFireMode == 0 ? OldBarrelIndex % 2 : (OldBarrelIndex % 12) + 2);
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    Super.PostInitAnimTree(SkelComp);

    if (SkelComp == Mesh)
    {
        Recoil_R = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_Right') );
        Recoil_L = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_Left') );

        Recoil_MPR_01 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_01') );
        Recoil_MPR_02 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_02') );
        Recoil_MPR_03 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_03') );
        Recoil_MPR_04 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_04') );
        Recoil_MPR_05 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_05') );
        Recoil_MPR_06 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_MR_06') );
        Recoil_MPL_01 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_01') );
        Recoil_MPL_02 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_02') );
        Recoil_MPL_03 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_03') );
        Recoil_MPL_04 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_04') );
        Recoil_MPL_05 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_05') );
        Recoil_MPL_06 = GameSkelCtrl_Recoil( mesh.FindSkelControl('Recoil_ML_06') );
    }
}

simulated function VehicleWeaponFireEffects(vector HitLocation, int SeatIndex)
{
   local Name FireTriggerTag;

   Super.VehicleWeaponFireEffects(HitLocation, SeatIndex);

   //`Log("VehicleWeaponFireEffects called",, '_Mammoth_Debug');
   FireTriggerTag = Seats[SeatIndex].GunSocket[GetBarrelIndex(SeatIndex)];

   if(Weapon != None) {
       if (Weapon.CurrentFireMode == 0)
       {
           switch(FireTriggerTag)
          {
          case 'FireSocket_Right':
             Recoil_L.bPlayRecoil = TRUE;
             break;
    
          case 'Firesocket_Left':
             Recoil_R.bPlayRecoil = TRUE;
             break;
          }
       }
       else
       {
          switch(FireTriggerTag)
          {
          case 'MFR_01':
             Recoil_MPR_01.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_01':
             Recoil_MPL_01.bPlayRecoil = TRUE;
             break;
    
          case 'MFR_02':
             Recoil_MPR_02.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_02':
             Recoil_MPL_02.bPlayRecoil = TRUE;
             break;
    
          case 'MFR_03':
             Recoil_MPR_03.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_03':
             Recoil_MPL_03.bPlayRecoil = TRUE;
             break;
    
          case 'MFR_04':
             Recoil_MPR_04.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_04':
             Recoil_MPL_04.bPlayRecoil = TRUE;
             break;
    
          case 'MFR_05':
             Recoil_MPR_05.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_05':
             Recoil_MPL_05.bPlayRecoil = TRUE;
             break;
    
          case 'MFR_06':
             Recoil_MPR_06.bPlayRecoil = TRUE;
             break;
    
          case 'MFL_07':
             Recoil_MPL_06.bPlayRecoil = TRUE;
             break;
    
          }
       }
   }
}

    
    
simulated function PostBeginPlay() {

    super.PostBeginPlay();
    init_();
	
	Mesh.AttachComponentToSocket(AntennaMeshL,'AntennaSocket_Left');
	Mesh.AttachComponentToSocket(AntennaMeshR,'AntennaSocket_Right');
	Mesh.AttachComponentToSocket(TowRopeMesh,'TowingRopeSocket');
	Mesh.AttachComponentToSocket(TowRopeMeshL,'TowingRopeSocket_L');
	Mesh.AttachComponentToSocket(TowRopeMeshR,'TowingRopeSocket_R');

	AntennaBeamControl = UTSkelControl_CantileverBeam(AntennaMeshL.FindSkelControl('Beam'));
	AntennaBeamControl = UTSkelControl_CantileverBeam(AntennaMeshR.FindSkelControl('Beam'));
	AntennaBeamControl = UTSkelControl_CantileverBeam(TowRopeMesh.FindSkelControl('Beam'));
	AntennaBeamControl = UTSkelControl_CantileverBeam(TowRopeMeshL.FindSkelControl('Beam'));
	AntennaBeamControl = UTSkelControl_CantileverBeam(TowRopeMeshR.FindSkelControl('Beam'));


	if(AntennaBeamControl != none)
	{
		AntennaBeamControl.EntireBeamVelocity = GetVelocity;
	}
}

function init_() {
    SetTimer(0.5f, true, 'regenerateHealth'); 
}
 
//Is it really OP to regenerate 2 health per second back to full?? I.. don't think so, at all. 
function regenerateHealth()
{
	if(bTakingDamage) return; 
    //if(Health  < HealthMax/2) {
    if(Health  < HealthMax) {    
		Health += RegenerationRate+(VRank*0.5);
    }
	if(Health > HealthMax) Health=HealthMax; 
}
    
simulated function SetHeroicMuzzleFlash(bool SetTrue)
 {
	 local int i; 
	 
	 for(i=0;i<VehicleEffects.Length;i++)
	 {
		 if((VehicleEffects[i].EffectStartTag=='PrimaryFire_Right' || VehicleEffects[i].EffectStartTag=='PrimaryFire_Left') && VehicleEffects[i].EffectRef != none) 
		 {
			 if(SetTrue) VehicleEffects[i].EffectRef.SetTemplate(Heroic_MuzzleFlash);
			 else
			VehicleEffects[i].EffectRef.SetTemplate(default.VehicleEffects[i].EffectTemplate);
			//break;
		 }
	 }
 }

DefaultProperties
{



//========================================================\\
//************** Vehicle Physics Properties **************\\
//========================================================\\


    Health=1200
    MaxDesireability=0.8
    MomentumMult=0.7
    bCanFlip=False
    bTurnInPlace=True
    bSeparateTurretFocus=True
    CameraLag=0.2 //0.55
	LookForwardDist=400
    GroundSpeed=300
    MaxSpeed=1000
    LeftStickDirDeadZone=0.1
    TurnTime=18
     ViewPitchMin=-13000
    HornIndex=0
    COMOffset=(x=0.0,y=0.0,z=-40.0)
	bRotateCameraUnderVehicle=true
	bAlwaysRegenerate = true
	
	RegenerationRate = 2 
	
    Begin Object Name=SimObject

	
        bClampedFrictionModel=true

        WheelSuspensionStiffness=175
        WheelSuspensionDamping=2.0
        WheelSuspensionBias=0.1

//        WheelLongExtremumSlip=0
//        WheelLongExtremumValue=20
//        WheelLatExtremumValue=4

        // Longitudinal tire model based on 10% slip ratio peak
        WheelLongExtremumSlip=0.1
        WheelLongExtremumValue=1.0
        WheelLongAsymptoteSlip=2.0
        WheelLongAsymptoteValue=0.6

        // Lateral tire model based on slip angle (radians)
        WheelLatExtremumSlip=0.35		// 0.05 	// 0.35     // 20 degrees
        WheelLatExtremumValue=2.0		// 0.9
        WheelLatAsymptoteSlip=1.4     	// 80 degrees
        WheelLatAsymptoteValue=2.0		// 0.9

        ChassisTorqueScale=0.0
        StopThreshold=20
        EngineDamping=3
        InsideTrackTorqueFactor=0.4
        TurnInPlaceThrottle=0.35
        TurnMaxGripReduction=0.995 //0.980
        TurnGripScaleRate=0.8
        MaxEngineTorque=3975//3875
        End Object
    SimObj=SimObject
    Components.Add(SimObject)


//========================================================\\
//*************** Vehicle Visual Properties **************\\
//========================================================\\


    Begin Object name=SVehicleMesh
        SkeletalMesh=SkeletalMesh'VH_MammothTank.Mesh.SK_VH_Mammoth'
        AnimTreeTemplate=AnimTree'RX_VH_MammothTank.Anims.AT_VH_MammothTank'
        PhysicsAsset=PhysicsAsset'RX_VH_MammothTank.Mesh.SK_VH_Mammoth_Physics'
        MorphSets[0]=MorphTargetSet'RX_VH_MammothTank.Mesh.MT_VH_MammothTank'
    End Object

    DrawScale=1.0
	
	SkeletalMeshForPT=SkeletalMesh'VH_MammothTank.Mesh.SK_VH_Mammoth'

//========================================================\\
//*********** Vehicle Seats & Weapon Properties **********\\
//========================================================\\

    Begin Object Name=CollisionCylinder
      //CollisionHeight=380.0
      CollisionRadius=208.0
      Translation=(X=0.0,Y=0.0,Z=0.0)
      End Object
    CylinderComponent=CollisionCylinder
    
    Seats(0)={(GunClass=class'Rx_Vehicle_MammothWeapon',
                GunSocket=("FireSocket_Left", "Firesocket_Right", "MFR_01", "MFL_01", "MFR_02", "MFL_02", "MFR_03", "MFL_03", "MFR_04", "MFL_04", "MFR_05", "MFL_05", "MFR_06", "MFL_06"),//("FireSocket_Left", "Firesocket_Right"),
                TurretControls=(TurretPitch,TurretRotate),
				TurretVarPrefix="",
                GunPivotPoints=(MainTurretYaw,MainTurretPitch),
                CameraTag=CamView3P,
                CameraBaseOffset=(Z=20),
				SeatBone=Base,
				SeatSocket=VH_Death,
                CameraOffset=-600,
                SeatIconPos=(X=0.5,Y=0.33),
                MuzzleFlashLightClass=class'Rx_Light_Tank_MuzzleFlash'
                )}

	Seats(1)={(GunClass=none,
				TurretVarPrefix="Passenger",
                CameraTag=CamView3P,
                CameraBaseOffset=(Z=20),
                CameraOffset=-600,
                SeatIconPos=(X=0.5,Y=0.33),
                MuzzleFlashLightClass=class'Rx_Light_Tank_MuzzleFlash'
                )}
}
