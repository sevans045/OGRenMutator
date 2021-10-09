class OG_Building_AirStrip_Internals extends Rx_Building_AirStrip_Internals;

`include(OGValues.uci);

DefaultProperties
{
    /***************************************************/
    /*               Building Variables                */
    /***************************************************/   
    HDamagePointsScale      = `BUILDING_DMGPOINTS_SCALE

    HealPointsScale         = 0.04f
    Destroyed_Score         = `BUILDING_DESTROYED_SCORE // Total number of points divided out when  
    
    HealthMax               = `BUILDING_HP
    BA_HealthMax            = `BUILDING_HP //Slightly more health for building armour, but obviously with half of it being unrepairable. 
    LowHPWarnLevel          = 200 // critical Health level
    RepairedHPLevel         = 300 // 85%
}