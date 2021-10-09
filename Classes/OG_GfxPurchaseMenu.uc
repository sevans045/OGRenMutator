/*
* File: OG_GFxPurchaseMenu
* Description: Removes airstrikes and repair tools from the purchase menu
* Project: OGRenMutator https://github.com/sevans045/OGRenMutator/
*/

class OG_GFxPurchaseMenu extends Rx_GFxPurchaseMenu;

function SelectMenu(int selectedIndex)
{
    if (selectedIndex != Clamp(selectedIndex, 0, 9) || bIsInTransition) {
        return;
    }
`log("---------------" @ selectedIndex @ "---------------",bDebug);

    switch (selectedIndex)
    {
        case 0: 
            if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[9].ID : NodClassMenuData[9].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[9].ID : NodVehicleMenuData[9].ID);
            }
            break;      
        case 1: 
            if (bMainDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIMainMenuData[selectedIndex-1].ID : NodMainMenuData[selectedIndex - 1].ID);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
        case 2: 
            if (bMainDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIMainMenuData[selectedIndex-1].ID : NodMainMenuData[selectedIndex - 1].ID);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
        case 3: 
            if (bMainDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIMainMenuData[selectedIndex-1].ID : NodMainMenuData[selectedIndex - 1].ID);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
        case 4: 
            if (bMainDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIMainMenuData[selectedIndex-1].ID : NodMainMenuData[selectedIndex - 1].ID);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
        case 5: 
            if (bMainDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIMainMenuData[selectedIndex-1].ID : NodMainMenuData[selectedIndex - 1].ID);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
        case 6: 
            if (bMainDrawerOpen) {
                rxPC.PlaySound(PurchaseSound);
                
                //set the current weapon to defaults so we can force perform our loadouts
        
                if (rxPC.CurrentSidearmWeapon == none) {
                    rxPC.CurrentSidearmWeapon = class'OG_InventoryManager'.default.SidearmWeapons[0];
                }
                
                if (rxPC.CurrentExplosiveWeapon == none) {
                    if (rxPC.bJustBaughtEngineer 
                    || Rx_Pawn(rxPC.Pawn).GetRxFamilyInfo() == class'OG_FamilyInfo_GDI_Hotwire' 
                    || Rx_Pawn(rxPC.Pawn).GetRxFamilyInfo() == class'OG_FamilyInfo_Nod_Technician'){
                        rxPC.RemoveAllExplosives();
                        if (TeamID == TEAM_GDI) {
                            rxPC.CurrentExplosiveWeapon = class'OG_InventoryManager_GDI_Hotwire'.default.ExplosiveWeapons[0];
                        } else {
                            rxPC.CurrentExplosiveWeapon = class'OG_InventoryManager_Nod_Technician'.default.ExplosiveWeapons[0];
                        }
                        rxPC.SetAdvEngineerExplosives(rxPC.CurrentExplosiveWeapon);
                    } else if (rxPC.bJustBaughtHavocSakura 
                    || Rx_Pawn(rxPC.Pawn).GetRxFamilyInfo() == class'Rx_FamilyInfo_GDI_Havoc'
                    || Rx_Pawn(rxPC.Pawn).GetRxFamilyInfo() == class'Rx_FamilyInfo_Nod_Sakura' ) {
                        rxPC.RemoveAllExplosives();
                        if (TeamID == TEAM_GDI) {
                            rxPC.CurrentExplosiveWeapon = class'OG_InventoryManager_GDI_Havoc'.default.ExplosiveWeapons[0];
                        } else {
                            rxPC.CurrentExplosiveWeapon = class'OG_InventoryManager_Nod_Sakura'.default.ExplosiveWeapons[0];
                        }
                        rxPC.AddExplosives(rxPC.CurrentExplosiveWeapon);
                    }  else {
                        rxPC.RemoveAllExplosives();
                        rxPC.CurrentExplosiveWeapon = class'OG_InventoryManager'.default.ExplosiveWeapons[0];
                        rxPC.AddExplosives(rxPC.CurrentExplosiveWeapon);
                    }
                }

                SetLoadout();
                rxPC.PerformRefill(rxPC);
                ClosePTMenu(false);
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                if (TeamID == TEAM_NOD) {
                    ChangeDummyVehicleClass(NodVehicleMenuData[selectedIndex - 1].ID);
                }
                else{
                    ChangeDummyVehicleClass(GDIVehicleMenuData[selectedIndex - 1].ID);
                }
            }
            break;
        case 7: 
            if (bMainDrawerOpen) {
                if (GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')) != none) {
                    GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')).SetBool("selected", false);
                }
                //check if there is something transitioning, fade out immidietly
                CancelCurrentAnimations();
                bIsInTransition = true;
                MainDrawerFadeOut();
                ItemDrawerFadeIn();
                BottomWidgetFadeIn(BackTween);
                bIsInTransition = false;
            } else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            } else if (bVehicleDrawerOpen) {
                //if (!rxBuildingOwner.AreAircraftDisabled()) {
                    ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
                //}
            }
            break;
        case 8: 
            if (bMainDrawerOpen) { 
                if (GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')) != none) {
                    GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')).SetBool("selected", false);
                }
                //check if there is something transitioning, fade out immidietly
                CancelCurrentAnimations();

                bIsInTransition = true;
                MainDrawerFadeOut();
                ClassDrawerFadeIn();
                BottomWidgetFadeIn(BackTween);
                bIsInTransition = false;
            }else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID);
            }
            else if (bVehicleDrawerOpen) {
                //if (!rxBuildingOwner.AreAircraftDisabled()) {
                    ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
                //}
            }
            break;
        case 9: 
            if (bMainDrawerOpen)
            {
                if (GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')) != none) {
                    GFxClikWidget(MainMenuGroup.GetObject("selectedButton", class'GFxClikWidget')).SetBool("selected", false);
                }
                //check if there is something transitioning, fade out immidietly
                CancelCurrentAnimations();
                
                bIsInTransition = true;
                rxPC.bIsInPurchaseTerminalVehicleSection = true;
                MainDrawerFadeOut();
                VehicleDrawerFadeIn();
                BottomWidgetFadeIn(BackTween);
                BottomWidgetFadeIn(VehicleInfoTween);
                bIsInTransition = false;
            }
            else if (bClassDrawerOpen){
                ChangeDummyPawnClass(TeamID == TEAM_GDI ? GDIClassMenuData[selectedIndex-1].ID : NodClassMenuData[selectedIndex - 1].ID); 
            }
            else if (bVehicleDrawerOpen) {
                ChangeDummyVehicleClass(TeamID == TEAM_GDI ? GDIVehicleMenuData[selectedIndex-1].ID : NodVehicleMenuData[selectedIndex - 1].ID);
            }
            break;
    }
}

DefaultProperties
{
    GDIItemMenuData(1) = (BlockType=EPBT_ITEM, id=1, PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Item_Airstrike_A10', iconID=62, hotkey="2", title="A-10 AIRSTRIKE", desc="<font size='8'>Pros:\n-5 seconds to impact\n-Quick bombardment\n-Anti-Infrantry/Vehicle\nCons:\n-Weak Vs. Buildings\n-USES ITEM SLOT</font>",cost="800",  type=1, bEnable = false)
    GDIItemMenuData(2) = (BlockType=EPBT_ITEM, id=2, PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Weapon_RepairTool', iconID=73, hotkey="3", title="REPAIR TOOL", desc="<font size='8'>Pros:\n-Repairs Units/Buildings\n-Disarms Mines\n\nCons:\n-Must Recharge\n-USES ITEM SLOT  </font>", cost="250", bEnable = false)
    NodItemMenuData(1) = (BlockType=EPBT_ITEM, id=1, PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Item_Airstrike_AC130', iconID=63, hotkey="2", title="AC-130 AIRSTRIKE", desc="<font size='8'>Pros:\n-5 seconds to impact\n-Quick bombardment\n-Anti-Infrantry/Vehicle\nCons:\n-Weak Vs. Buildings\n-USES ITEM SLOT</font>", cost="800" , type=1, bEnable = false)
    NodItemMenuData(2) = (BlockType=EPBT_ITEM, id=2, PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Weapon_RepairTool', iconID=73, hotkey="3", title="REPAIR TOOL", desc="<font size='8'>Pros:\n-Repairs Units/Buildings\n-Disarms Mines\n\nCons:\n-Must Recharge\n-USES ITEM SLOT </font>", cost="200", bEnable = false)

    GDIMainMenuData(3) = (BlockType=EPBT_CLASS, id=4,  PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Weapon_RepairGun', iconID=50, hotkey="5", title="ENGINEER", desc="Armour: Flak\nSpeed: 95\nSide: Silenced Pistol\nRemote C4\n+Anti-Building\n+Repair/Support",  cost="FREE", type=2, damage=3,range=1,rateOfFire=6,magCap=6)
    NodMainMenuData(3) = (BlockType=EPBT_CLASS, id=4,  PTIconTexture=Texture2D'RenXPurchaseMenu.T_Icon_Weapon_RepairGun', iconID=50, hotkey="5", title="ENGINEER", desc="Armour: Flak\nSpeed: 95\nSide: Silenced Pistol\nRemote C4\n+Anti-Building\n+Repair/Support",  cost="FREE", type=2, damage=3,range=1,rateOfFire=6,magCap=6)

    PurchaseSound=SoundCue'OG_FX.Sounds.SC_PurchaseSound'
}
