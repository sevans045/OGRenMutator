class OG_Vehicle_Artillery extends Rx_Vehicle_Artillery;

defaultproperties
{
    Seats(0)={(GunClass=class'OG_Vehicle_Artillery_Weapon',
        GunSocket=(Fire01),
        TurretControls=(TurretPitch,TurretRotate),
        GunPivotPoints=(MainTurretYaw,MainTurretPitch),
        CameraTag=CamView3P,
        SeatBone=Base,
        SeatSocket=VH_Death,
        CameraBaseOffset=(Z=-10),
        CameraOffset=-600,
        SeatIconPos=(X=0.5,Y=0.33),
        MuzzleFlashLightClass=class'Rx_Light_Tank_MuzzleFlash'
    )}
}