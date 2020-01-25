class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] call life_fnc_wantedMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:RscPicture {
		text = "\cg_client\textures\wantedmenu.paa";
		x = 0.288594 * safezoneW + safezoneX;
		y = 0.203 * safezoneH + safezoneY;
		w = 0.417656 * safezoneW;
		h = 0.561 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			x = 0.326042 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.0757812 * safezoneW;
			h = 0.245704 * safezoneH;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.412865 * safezoneW + safezoneX;
			y = 0.371593 * safezoneH + safezoneY;
			w = 0.255833 * safezoneW;
			h = 0.283703 * safezoneH;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class CloseButtonKey : RscButtonSilent {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class PardonButtonKey : RscButtonSilent {
			idc = 2405;
			text = "";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.326041 * safezoneW + safezoneX;
			y = 0.618519 * safezoneH + safezoneY;
			w = 0.0751042 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
	};
};