class ES_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = 1;
	
	class controlsBackground
	{	
		class BG: ES_RscText
		{
			idc = -1;
			x = 0.834761 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.164806 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
	
	class controls
	{
		class SpawnPointList: ES_RscListNbox
		{
			idc = 38510;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			text = "";
			coloumns[] = {0,0,0.9};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.834761 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.164806 * safezoneW;
			h = 0.539 * safezoneH;
			colorText[] = {1,0.502,0,1};
			onLBSelChanged = "_this call ES_fnc_spawnPointSelected;";
		};

		class spawnButton: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call ES_fnc_spawnConfirm";
			x = 0.834761 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0824028 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0.502,0,1};
		};

		class lobby: ES_RscButtonMenu
		{
			idc = -1;
			text = "In die Lobby";
		    onButtonClick = "closeDialog 0; [""Abort"",true,false] call BIS_fnc_endMission;";
			x = 0.927464 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0824028 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
		};
	};
};