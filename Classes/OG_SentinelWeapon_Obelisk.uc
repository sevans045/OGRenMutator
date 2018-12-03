/*
* File: OG_SentinelWeapon_Obelisk
* Description: Lowers the charge hold time of the Obelisk.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_SentinelWeapon_Obelisk extends Rx_SentinelWeapon_Obelisk;

var float TimeToHoldCharge;

state WindingUp
{
    simulated function BeginState(name PreviousStateName)
    {
        if(Role == ROLE_Authority)
        {
            FiringState = 1;
        }
        WindUpSound.Stop();
        WindUpSound.Play();
        SetTimer(0.25, true, 'crystalChargingGlow');
        ChargeUpMuzzleFlash.Flash();
        SetTimer(2.2, false);
    }

    function bool FireAt(Vector Start, Rotator BarrelDir, Vector End)
    {
        return false;
    }
    
    function NotifyNewTarget(Actor NewTarget)
    {
        super.NotifyNewTarget(NewTarget);
        if(IsTimerActive('GotoIdle')) {
    		ClearTimer('GotoIdle');
    		GotoState('Running');
    	}
    }    

    simulated function Timer()
    {
        if(Cannon != none && Cannon.Health > 0 && Cannon.bTracking)
        {
            GotoState('Running');
        }
        else
        {
            SetTimer(TimeToHoldCharge, false, 'GotoIdle');
        }
    }
    
    simulated function GotoIdle() 
    {
    	GotoState('Idle');
    }
}

DefaultProperties
{
	WindDownDelay = 0.1f // Don't change this
	TimeToHoldCharge = 1.2f // Change this as you'd like, though 1.2 seems good
}