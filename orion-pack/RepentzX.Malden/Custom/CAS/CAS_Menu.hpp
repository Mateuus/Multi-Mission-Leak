/*
	Author: cobra4v320
	Dialog: CAS Menu
*/

class life_CAS_MENU 
{
	idd = 10001; 
    onLoad = "_this ExecVM 'Custom\CAS\selectWeapon.sqf'"; 
	name = "life_CAS_diag";
	movingEnable = 0;
    enableSimulation = 1;
	
	class controlsBackground {
		class life_RscTitleBackground: life_RscPicture
		{
			idc = -1;
			x = 0.355627 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.288747 * safezoneW;
			h = 0.55 * safezoneH;
			text = "images\Textures\back.paa";
		};
	};

	class controls
	{
		class menu_map: life_RscMapControl
		{
			idc = -1;
			x = 0.404094 * safezoneW + safezoneX;
			y = 0.2734 * safezoneH + safezoneY;
			w = 0.191813 * safezoneW;
			h = 0.2794 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,1};
			colorOutside[] = {0.1,0.5,0.1,0.44};
			colorRailway[] = {0.1,0.1,0.5,0.44};
		};
		class comboAmmo: life_RscCombo
		{
			idc = 2100;

			x = 0.37625 * safezoneW + safezoneX;
			y = 0.6012 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.01925 * safezoneH;
		};
		class comboPlane: life_RscCombo
		{
			idc = 2101;

			x = 0.52475 * safezoneW + safezoneX;
			y = 0.6012 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.01925 * safezoneH;
		};
		class CAS_button: Life_RscButtonMenu
		{
			idc = -1;
			text = "Call CAS";
			x = 0.47525 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = {"",0,1};
			soundClick[] = {"",0,1};
			soundEscape[] = {"",0,1};
			soundPush[] = {"",0,1};
			font = "TahomaB";
			onButtonClick = "[] execVM 'Custom\CAS\startStrike.sqf'; closeDialog 0";
			colorBackground[] = {0,0,0,.8};
			colorText[] = {1,1,1,1};
		};
		class ammo_text: life_RscText
		{
			idc = -1;
			text = "Select Weapon";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.5616 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class aircraft_text: life_RscText
		{
			idc = -1;
			text = "Select Aircraft";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.5638 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};