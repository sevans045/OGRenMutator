/*********************************************************
*
* File: RxInventoryManager.uc
* Author: RenegadeX-Team 
* Project: Renegade-X UDK <www.renegade-x.com>
*
* Desc:
*  Overwrites the default pickup methods for the new inventory system.
*
* ConfigFile:
*
*********************************************************
* <3 Vipeax
*********************************************************/

class OG_InventoryManager extends Rx_InventoryManager;

simulated function bool IsPrimaryWeaponAllowed(class<Rx_Weapon> w) {return true;}
simulated function bool IsSecondaryWeaponAllowed(class<Rx_Weapon> w)  {return true;}
simulated function bool IsSidearmWeaponAllowed(class<Rx_Weapon> w) {return true;}
simulated function bool IsExplosiveWeaponAllowed(class<Rx_Weapon> w) {return true;}
simulated function bool IsItemAllowed(class<Rx_Weapon> w) {return true;}

DefaultProperties
{
	SidearmWeapons[0] = class'OG_Weapon_Pistol';
	ExplosiveWeapons[0] = class'Rx_Weapon_TimedC4';
}