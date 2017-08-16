class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		
		class backgroundKeyChainMenu: Life_RscPicture
		{
			idc = 2016;
			text = "icons\phone\blanktablet.paa";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.629062 * safezoneW;
			h = 0.659 * safezoneH;
		};
	};
	
	class controls
	{
	
		class Title: Life_RscTitle
		{
			idc = -1;
			text = "$STR_Keys_Title"; //--- ToDo: Localize;
			x = 0.282062 * safezoneW + safezoneX;
			y = 0.22677966 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class KeyChainList : Life_RscListbox
		{
			idc = 2701;
			text = "";
			sizeEx  = 0.035;
			x = 0.282062 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.430719 * safezoneW;
			h = 0.402 * safezoneH;
		};
		
		class NearPlayers: Life_RscCombo
		{
			idc = 2702;
			x = 0.282062 * safezoneW + safezoneX;
			y = 0.73708475 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
			
		class DropKey_icon: life_RscPicture
		{
			idc = 999555;
			text = "icons\phone\remove.paa";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};	
		
		class DropKey: life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
			tooltip = "Schlüssel weg werfen";
		};

		class GiveKey_icon: life_RscPicture
		{
			idc = 999955;
			text = "icons\phone\give.paa";
			x = 0.400656 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class GiveKey: Life_RscButtonMenu
		{
			idc = 2703;
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.400656 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Zweitschlüssel vergeben";
		};
		/*
		class RefreshNear_icon: life_RscPicture
		{
			idc = 999955;
			text = "icons\phone\refresh.paa";
			x = 0.4367502 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class RefreshNear: Life_RscButtonMenu
		{
			idc = 2703;
			onButtonClick = "[2] call life_fnc_refreshNear;";
			x = 0.4367502 * safezoneW + safezoneX;
			y = 0.72508475 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Nahe Spieler neu laden";
		};
		*/
		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = " "; //--- ToDo: Localize;
			x = (38.53/52) * safezoneW + safezoneX;
			y = (6.5/30) * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = (17/30) * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Zurück";
		};
	};
};