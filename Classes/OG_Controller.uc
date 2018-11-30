/*
* File: OG_Controller
* Description: Turns off cooldown for refills and removes airstrikes/repair tool.
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_Controller extends Rx_Controller;

DefaultProperties
{
	RefillCooldownTime = 0
	PTMenuClass = class'OG_GFxPurchaseMenu'
}