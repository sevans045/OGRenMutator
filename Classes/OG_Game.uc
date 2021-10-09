/*
* File: OG_Game
* Description: Replaces controller and PS, changing vehicles and removing refill cooldown.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Game extends Rx_Game;

event InitGame(string Options, out string ErrorMessage)
{
    super.InitGame(Options, ErrorMessage);

	AddMutator("OGRen.OG_Mutator");
	BaseMutator.InitMutator(Options, ErrorMessage);
}

DefaultProperties
{
	PlayerControllerClass = class'OG_Controller'
	PurchaseSystemClass = class'OG_PurchaseSystem'
	DefaultPawnClass = class'OG_Pawn'
	HUDClass = class'OG_HUD'
	VehicleManagerClass=class'OG_VehicleManager'

	buildingArmorPercentage = 0
}