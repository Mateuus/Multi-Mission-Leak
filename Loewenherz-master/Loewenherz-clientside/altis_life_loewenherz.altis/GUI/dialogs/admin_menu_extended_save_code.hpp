class admin_menu_extended_save_code {
	idd = 8574;
	name= "admin_menu_extended_save_code";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "";

	class controlsBackground {
class BCKGRND: lhm_RscText
{
	idc = 1000;
	x = 0.337916 * safezoneW + safezoneX;
	y = 0.287556 * safezoneH + safezoneY;
	w = 0.211042 * safezoneW;
	h = 0.338333 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class Header: lhm_RscText
{
	idc = 1001;
	text = "Speichere Skript"; //--- ToDo: Localize;
	x = 0.338021 * safezoneW + safezoneX;
	y = 0.270371 * safezoneH + safezoneY;
	w = 0.211042 * safezoneW;
	h = 0.0198147 * safezoneH;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};
class BTN_ENTERCODE: lhm_RscText
{
	idc = 1002;
	text = "Namen eingeben:"; //--- ToDo: Localize;
	x = 0.346198 * safezoneW + safezoneX;
	y = 0.291704 * safezoneH + safezoneY;
	w = 0.11625 * safezoneW;
	h = 0.0244444 * safezoneH;
};
	};

	class controls {
class EDIT_NAME: lhm_RscEdit
{
	idc = 1400;
	text = "";
	x = 0.345624 * safezoneW + safezoneX;
	y = 0.320852 * safezoneH + safezoneY;
	w = 0.1175 * safezoneW;
	h = 0.0238518 * safezoneH;
};
class RscListbox_1500: lhm_RscListbox
{
	idc = 1500;
	sizeEx = 0.040;
	x = 0.344808 * safezoneW + safezoneX;
	y = 0.351475 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.26863 * safezoneH;
};
class BTN_close: lhm_RscButtonMenu
{
	idc = 2400;
	text = "Close"; //--- ToDo: Localize;
	onButtonClick = "CloseDialog 8574;";
	x = 0.469681 * safezoneW + safezoneX;
	y = 0.584988 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.0309261 * safezoneH;
};
class BTN_save: lhm_RscButtonMenu
{
	idc = 2401;
	text = "Speichern"; //--- ToDo: Localize;
	OnButtonClick = "[] spawn lhm_fnc_new_admin_menu_save_Code;";
	x = 0.46927 * safezoneW + safezoneX;
	y = 0.321296 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.0309261 * safezoneH;
};
class BTN_Delete: lhm_RscButtonMenu
{
	idc = 2402;
	text = "Loeschen"; //--- ToDo: Localize;
	OnButtonClick = "[] spawn lhm_fnc_new_admin_menu_erase_code;";
	x = 0.469271 * safezoneW + safezoneX;
	y = 0.360184 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.0309261 * safezoneH;
};


	};
};