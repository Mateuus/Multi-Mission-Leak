class EMonkeys_RscProgress2
{
    type = 8;
    style = 0;
    x = 0.344;
    y = 0.619;
    w = 0.313726;
    h = 0.0261438;
    texture = "";
    shadow = 2;
    colorFrame[] = {255, 255, 0, 1};
    colorBackground[] = {255,255,0,0.7};
    colorBar[] = {255, 255, 0, 1};
};

class EMonkeys_progress_loading
{
	name = "EMonkeys_progress_loading";
	idd = 38210;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['EMonkeys_progress_loading',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class ProgressBar : EMonkeys_RscProgress2
		{
			idc = 3201;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.154 * safezoneH;
		};
		
		class background : EMonkeys_RscPicture
		{
			idc = 3300;
			text= "core\textures\menu_background\bg_spawn.paa";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 0.979 * safezoneH;
		};
		
		class ProgressText : EMonkeys_RscStructuredText
		{
			idc = 3400;
			text = "";
			x = 0.401146 * safezoneW + safezoneX;
			y = 0.597593 * safezoneH + safezoneY;
			w = 0.27823 * safezoneW;
			h = 0.0348518 * safezoneH;
		};
		
		class disconect : EMonkeys_RscButtonMenu
		{
			idc = 3401;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0.75,0.75,0.75,0.05};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			tooltip = "Zur Lobby zurückkehren";
			onButtonClick="['BackToLobby',true,0,false,false] call BIS_fnc_endMission;";
			x = 0.281234 * safezoneW + safezoneX;
			y = 0.600035 * safezoneH + safezoneY;
			w = 0.111563 * safezoneW;
			h = 0.0420375 * safezoneH;
		};
	};
};