	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class IconBar8 : life_RscPicture 
			{
				idc = 23528;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.76;
				w = 0.12; h = 0.12;
			};
			
			class IconBar7 : life_RscPicture 
			{
				idc = 23527;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.61;
				w = 0.12; h = 0.12;
			};
			
			class IconBar6 : life_RscPicture 
			{
				idc = 23526;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.46;
				w = 0.12; h = 0.12;
			};
			
			class IconBar5 : life_RscPicture 
			{
				idc = 23525;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.31;
				w = 0.12; h = 0.12;
			};
			
			class IconBar4 : life_RscPicture 
			{
				idc = 23524;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.16;
				w = 0.12; h = 0.12;
			};
			
			class IconBar3 : life_RscPicture 
			{
				idc = 23523;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-1.01;
				w = 0.12; h = 0.12;
			};
			
			class IconBar2 : life_RscPicture 
			{
				idc = 23522;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-0.86;
				w = 0.12; h = 0.12;
			};
			
			class IconBar1 : life_RscPicture 
			{
				idc = 23521;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-0.71;
				w = 0.12; h = 0.12;
			};
			
			class IconBar0 : life_RscPicture
			{
				idc = 23520;
				text = "";
				x = 0.00499997 * safezoneW + safezoneX; y = safeZoneY+safeZoneH-0.56;
				w = 0.12; h = 0.12;
			};
		};
		
		class controls
		{};   
 	};