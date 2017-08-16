class vjGBIGiQX
{
 idd = 3500;
 name = "vjGBIGiQX";
 movingEnable = 0;
 enableSimulation = 1;

 class controlsBackground
 {
 class RscTitleBackground : EPFMAm
 {
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_A',1])"};
 idc = -1;
 x = 0.1;
 y = 0.2;
 w = 0.33;
 h = (1 / 25);
 };

 class RscBackground : EPFMAm
 {
 colorBackground[] = {0, 0, 0, 0.7};
 idc = -1;
 x = 0.1;
 y = 0.2 + (11 / 250);
 w = 0.33;
 h = 0.7 - (22 / 250);
 };

 class RscTitleText : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = 3501;
 text = "";
 x = 0.1;
 y = 0.2;
 w = 0.33;
 h = (1 / 25);
 };

 class VehicleWeight : RscTitleText
 {
 idc = 3504;
 style = 1;
 text = "";
 };

 class RscTrunkText : EPFMAm
 {
 idc = -1;
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", 0.5};
 text = "$STR_Trunk_TInventory";
 sizeEx = 0.04;

 x = 0.11; y = 0.25;
 w = 0.3; h = 0.04;
 };
 };

 class Controls
 {
 class TrunkGear : ZaMJRapk
 {
 idc = 3502;
 text = "";
 sizeEx = 0.030;

 x = 0.11; y = 0.29;
 w = 0.3; h = 0.42;
 };

 class TrunkEdit : IkurrfNqo
 {
 idc = 3505;
 text = "1";
 sizeEx = 0.030;
 x = 0.11; y = 0.72;
 w = 0.3; h = 0.03;
 };

 class TakeItem : MCHU
 {
 idc = -1;
 text = "$STR_Trunk_Take";
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", 0.5};
 onButtonClick = "[] call zero_fnc_vDrUVqr;";
 x = 0.19; y = 0.78;
 w = (6.25 / 40);
 h = (1 / 25);
 };

 class ButtonClose : MCHU {
 idc = -1;
 
 text = "$STR_Global_Close";
 onButtonClick = "closeDialog 0;";
 x = 0.1;
 y = 0.9 - (1 / 25);
 w = (6.25 / 40);
 h = (1 / 25);
 };
 };
};
