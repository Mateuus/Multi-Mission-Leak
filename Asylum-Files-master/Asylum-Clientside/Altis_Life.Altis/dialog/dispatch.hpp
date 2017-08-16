class life_dispatch_menu
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = -1;
			y = -1;
			w = 3;
			h = 3;
			colorBackground[] = {0,0,0,1};
		};
				
		class MapView : Life_RscMapControl 
		{
			idc = 39501;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.506 * safezoneH;
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{
		class CopHeader: Life_RscText
		{
			idc = -1;
			text = "Officers on Duty";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0.6};
		};

		class CopList : Life_RscListbox
		{
			idc = 39510;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.23 * safezoneH;
			onLBSelChanged = "[_this] spawn life_fnc_dispatchSelCop";
		};
		
		class SpectateCop : Life_RscButtonMenu
		{
			idc = 39534;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] spawn life_fnc_dispatchSpectate";
			text = "Enable GoPro Uplink";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SetTask : Life_RscButtonMenu
		{
			idc = 39512;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_dispatchSetTask";
			text = "Assign Task";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class EndTask : Life_RscButtonMenu
		{
			idc = 39526;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_dispatchEndTask";
			text = "End Task";
			x = 0.7 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.052656 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TaskHeader: Life_RscText
		{
			idc = -1;
			text = "Active Tasks";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0.6};
		};
		
		class TaskList : Life_RscListbox
		{
			idc = 39514;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.165 * safezoneH;
			onLBSelChanged = "[_this] spawn life_fnc_dispatchSelTask";
		};
		
		class CommsHeader: Life_RscText
		{
			idc = -1;
			text = "Comms";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0.6};
		};
		
		class CommsEdit: Life_RscEdit
		{
			idc = 39516;
			text = "";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CommsOfficer : Life_RscButtonMenu
		{
			idc = 39518;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[0] call life_fnc_dispatchMessage";
			text = "Sel. Officer";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CommsTask : Life_RscButtonMenu
		{
			idc = 39520;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[1] call life_fnc_dispatchMessage";
			text = "All on Task";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Comms911 : Life_RscButtonMenu
		{
			idc = 39522;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[2] call life_fnc_dispatchMessage";
			text = "911 Reporter";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CommsRadioToggle911 : Life_RscButtonMenu
		{
			idc = 39528;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[false] call life_fnc_dispatchRadio";
			text = "911 Add Chan";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.805 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CommsRadioToggleCop : Life_RscButtonMenu
		{
			idc = 39530;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true] call life_fnc_dispatchRadio";
			text = "Cop Add Chan";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.805 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CommsRadioFlush : Life_RscButtonMenu
		{
			idc = 39532;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true, true] call life_fnc_dispatchRadio";
			text = "Empty Chan";
			x = 0.439529 * safezoneW + safezoneX;
			y = 0.805 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class FeedHeader: Life_RscText
		{
			idc = -1;
			text = "Data Feed";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0.6};
		};
		
		class FeedText: Life_RscStructuredText
		{
			idc = 39524;
			text = "Feed Disconnected.";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};