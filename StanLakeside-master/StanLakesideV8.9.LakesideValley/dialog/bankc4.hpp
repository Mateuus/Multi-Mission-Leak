class c4timer
{
idd = 12198;
movingEnable = true;
enableSimulation = true;
duration = 500000;
onLoad = "uiNamespace setVariable [""c4timer"", _this select 0];";
onunLoad = "if (isNil 'bombPlanted') then { [true,'blastingcharge',1] call life_fnc_handleInv;}; bombPlanted = Nil;";
//onunload =
objects[] = { };
controls[]=
{
"background",
"colon",
"zero1",
"zero2",
"displaydoubles",
"displaysingles",
"submit",
"upbutton",
"downbutton"
};
class background: RscPicture
{
	idc = 1200;
	text = "\A3L_Client2\c4files\bomb.paa";
	x = 0.285937 * safezoneW + safezoneX;
	y = 0.213074 * safezoneH + safezoneY;
	w = 0.416093 * safezoneW;
	h = 0.582074 * safezoneH;
};
class colon: RscPicture
{
	idc = 1205;
	text = "\A3L_Client2\c4files\colon.paa";
	x = 0.524218 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.033 * safezoneH;
};
class zero1: RscPicture
{
	idc = 1203;
	text = "\A3L_Client2\c4files\pic0.paa";
	x = 0.492291 * safezoneW + safezoneX;
	y = 0.47337 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class zero2: RscPicture
{
	idc = 1204;
	text = "\A3L_Client2\c4files\pic0.paa";
	x = 0.508854 * safezoneW + safezoneX;
	y = 0.473148 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class displaydoubles: RscPicture
{
	idc = 154268;
	text = "\A3L_Client2\c4files\pic0.paa";
	x = 0.529375 * safezoneW + safezoneX;
	y = 0.47337 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class displaysingles: RscPicture
{
	idc = 154269;
	text = "\A3L_Client2\c4files\pic0.paa";
	x = 0.546874 * safezoneW + safezoneX;
	y = 0.473148 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class submit: RscButton
{
	idc = 154271;
	text = ""; //--- ToDo: Localize;
	x = 0.415104 * safezoneW + safezoneX;
	y = 0.471296 * safezoneH + safezoneY;
	w = 0.0251042 * safezoneW;
	h = 0.0855556 * safezoneH;
	soundEnter[] = {"", 0.09, 1};
    soundPush[] = {"", 0.09, 1};
    soundClick[] = {"", 0.07, 1};
    soundEscape[] = {"", 0.09, 1};
	action = "bombPlanted = true; closedialog 0; [_this] call fnc_armc4;";
};
class upbutton: RscButton
{
	idc = 154272;
	text = ""; //--- ToDo: Localize;
	x = 0.556771 * safezoneW + safezoneX;
	y = 0.526852 * safezoneH + safezoneY;
	w = 0.0159897 * safezoneW;
	h = 0.0220001 * safezoneH;
	soundEnter[] = {"", 0.09, 1};
    soundPush[] = {"", 0.09, 1};
    soundClick[] = {"", 0.07, 1};
    soundEscape[] = {"", 0.09, 1};
	action = "[_this] call fnc_c4buttonup;";
};
class downbutton: RscButton
{
	idc = 154273;
	text = ""; //--- ToDo: Localize;
	x = 0.534114 * safezoneW + safezoneX;
	y = 0.526519 * safezoneH + safezoneY;
	w = 0.014948 * safezoneW;
	h = 0.0229259 * safezoneH;
	soundEnter[] = {"", 0.09, 1};
    soundPush[] = {"", 0.09, 1};
    soundClick[] = {"", 0.07, 1};
    soundEscape[] = {"", 0.09, 1};
	action = "[_this] call fnc_c4buttondown;";
};
};