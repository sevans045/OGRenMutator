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

DefaultProperties
{
	Mass = 100
	Begin Object Name=SimObject
    	bClampedFrictionModel=true
	
    	WheelSuspensionStiffness=70
    	WheelSuspensionDamping=5
    	WheelSuspensionBias=0.1
	
//  	  WheelLongExtremumSlip=0
//  	  WheelLongExtremumValue=20
//  	  WheelLatExtremumValue=4
	
    	// Longitudinal tire model based on 10% slip ratio peak
    	WheelLongExtremumSlip=0.5
    	WheelLongExtremumValue=2.0
    	WheelLongAsymptoteSlip=2.0
    	WheelLongAsymptoteValue=0.6
	
    	// Lateral tire model based on slip angle (radians)
    	   WheelLatExtremumSlip=0.5     // 20 degrees
    	WheelLatExtremumValue=4.0
    	WheelLatAsymptoteSlip=1.4     // 80 degrees
    	WheelLatAsymptoteValue=2.0
	
    	ChassisTorqueScale=0.0
    	StopThreshold=20
    	EngineDamping=4
    	InsideTrackTorqueFactor=0.375
    	TurnInPlaceThrottle=0.275
    	TurnMaxGripReduction=0.997
    	TurnGripScaleRate=0.8
    	MaxEngineTorque=6000
    End Object
    SimObj=SimObject
    Components.Add(SimObject)
}