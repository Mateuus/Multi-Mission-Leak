class life_taxiMenu {
	idd = 6600;
	name= "life_taxiMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
	};
	
	class controls {

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by RyanTT | AltisLifeRPG, v1.063, #Vudeku)
////////////////////////////////////////////////////////

class RscText_1000: Life_RscText
{
	idc = -1;
	x = 0.276503 * safezoneW + safezoneX;
	y = 0.323956 * safezoneH + safezoneY;
	w = 0.446995 * safezoneW;
	h = 0.363091 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,0.7};
};
class RscListbox_6601: Life_RscListbox
{
	idc = 6601;
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.356964 * safezoneH + safezoneY;
	w = 0.435533 * safezoneW;
	h = 0.286072 * safezoneH;
	sizeEx = 0.05;
};
class RscButtonMenu_2400: Life_RscButtonMenu
{
	idc = -1;
	text = "ACCEPT SELECTED REQUEST"; //--- ToDo: Localize;
	onButtonClick = "[] spawn life_fnc_taxi_acceptCall;";
	x = 0.545846 * safezoneW + safezoneX;
	y = 0.654039 * safezoneH + safezoneY;
	w = 0.171921 * safezoneW;
	h = 0.0220055 * safezoneH;
};
class RscButtonMenu_2401: Life_RscButtonMenu
{
	idc = -1;
	text = "ABORT"; //--- ToDo: Localize;
	onButtonClick = "closeDialog 0;";
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.654039 * safezoneH + safezoneY;
	w = 0.0802298 * safezoneW;
	h = 0.0220055 * safezoneH;
};
class RscText_1001: Life_RscText
{
	idc = -1;
	text = "CURRENTLY ACTIVE REQUESTS"; //--- ToDo: Localize;
	x = 0.287964 * safezoneW + safezoneX;
	y = 0.330556 * safezoneH + safezoneY;
	w = 0.200574 * safezoneW;
	h = 0.0220055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


	};
};