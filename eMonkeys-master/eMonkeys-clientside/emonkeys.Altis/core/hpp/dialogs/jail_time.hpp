
class jail_time
{
	idd = 26500;
	name = "jail_time";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
	
		class jail_back: emonkeys_RscText
		{
			idc = 2200;
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class jail_header: EMonkeys_RscStructuredText
		{
			idc = 1102;
			text = "Knast Zeit";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class jail_close: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class jail_timeback: emonkeys_RscText
		{
			idc = 2201;
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class jail_text: EMonkeys_RscStructuredText
		{
			idc = 1101;
			text = "Zeit angeben, wie viele Minuten die Person im Knast bleiben soll.";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class jail_time: EMonkeys_RscText
		{
			idc = 2601;
			text = "Zeit:";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class jail_edittime: EMonkeys_RscEdit
		{
			idc = 1400;
			text = "15";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class jail_timemin: EMonkeys_RscText
		{
			idc = 1001;
			text = "Minuten";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class jail_ok: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "OK";
			onButtonClick="[] spawn EMonkeys_fnc_arrestDialog_Arrest;";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			
			
		};
	};
};