/*
* File: OG_Weapon_DeployedProxyC4
* Description: Gives mines a regular detection radius, instead of one offset.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Weapon_DeployedProxyC4 extends Rx_Weapon_DeployedProxyC4;

function CheckProxy()
{
	local Rx_Pawn P;
	local Rx_Vehicle V;
	local vector endL, normthing; 
	local vector ScanLoc;
	
	//Store our location, but scan from about 13 units above our location. 
	ScanLoc=location;
	   
	//ScanLoc.z+=TestHeight; Comment this out, as now mines can be on door tops and should detect stuff under them.
	   
	ForEach VisibleCollidingActors(class'Rx_Pawn', P, TriggerRadius,ScanLoc, true)
	{
    	if ((GetTeamNum() != P.GetTeamNum()) && (P.Health > 0) && bDeployed)
    	{
      		Activator = P;
			Detonate();
			ClearTimer('CheckProxy');
			break;
      	}
   }
   
	ForEach OverlappingActors(class'Rx_Vehicle', V, VehicleTriggerRadius,, true)
	{
    	if ((GetTeamNum() != V.GetTeamNum()) && (V.Health > 0) && bDeployed && !(V.GetTeamNum() == 255))
      	{
       	  	Detonate();
	      	ClearTimer('CheckProxy');
	      	break;
      	}
   }
}