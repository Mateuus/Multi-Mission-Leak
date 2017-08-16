class YjvSphQE
{
 idd = 7300;
 name = "YjvSphQE";
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground
 {
 };

 class Controls
 {
 class MedicsOnline : EPFMAm
 {
 idc = 7304;
 colorBackground[] = {0,0,0,0};
 text = "";
 x = 0.00190622 * safezoneW + safezoneX;
 y = 0.0776 * safezoneH + safezoneY;
 w = 0.8;
 h = (1 / 25);
 };

 class RespawnBtn : MCHU
 {
 idc = 7302;
 x = 0.9 * safezoneW + safezoneX;
 y = 0.00500001 * safezoneH + safezoneY;
 w = (9 / 40);
 h = (1 / 25);
 text = "Respawn";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 30) exitWith {titleText ['Du kannst nur alle 30 Sekunden auf Respawn klicken','PLAIN'];}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [] call zero_fnc_kxFxpIWPJ";
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_A',1])"};
 class Attributes
 {
 align = "center";
 };
 };

 class MedicBtn : MCHU
 {
 idc = 7303;
 x = 0.9 * safezoneW + safezoneX;
 y = 0.0292 * safezoneH + safezoneY;
 w = (9 / 40);
 h = (1 / 25);
 onButtonClick = "[] call zero_fnc_EKgyp;";
 text = "$STR_Medic_Send";
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_A',1])"};
 class Attributes
 {
 align = "center";
 };
 };

 class respawnTime : EPFMAm
 {
 idc = 7301;
 colorBackground[] = {0,0,0,0};
 text = "";
 x = 0.422656 * safezoneW + safezoneX;
 y = 0.918 * safezoneH + safezoneY;
 w = 0.8;
 h = (1 / 25);
 };
 };
};
