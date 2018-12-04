/*
* File: OG_Game
* Description: Replaces controller and PS, changing vehicles and removing refill cooldown.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Game extends Rx_Game;

DefaultProperties
{
	PlayerControllerClass = class'OG_Controller'
	PurchaseSystemClass = class'OG_PurchaseSystem'
}