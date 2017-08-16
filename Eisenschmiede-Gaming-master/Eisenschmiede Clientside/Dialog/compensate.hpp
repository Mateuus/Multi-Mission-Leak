class ES_Admin_Compensate {
	idd = 9920;
	name= "ES_admin_compensate_give";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 9920)}; ((findDisplay 9920) displayCtrl 9921) ctrlSetText localize ""STR_Admin_Amount""};";
	
	class controlsBackground {
		class ES_RscTitleBackground:ES_RscText {
			colorBackground[] = {1,0.6,0,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:ES_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : ES_RscStructuredText
		{
			idc = 9921;
			sizeEx = 0.020;
			text = "Wieviel Geld willst du dir geben?";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : ES_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Admin_Compensate";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class AdminCloseComp : ES_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensVer : ES_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_Compensate";
			colorBackground[] = {1,0.6,0,1};
			onButtonClick = "[] spawn ES_fnc_adminCompensate;";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensTex : ES_RscEdit
		{
			idc = 9922;
			text = "";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};
