class adminvergabe {
	idd=9100;
	movingEnable = false;
	enableSimulation = true;
	onLoad="[0] spawn life_fnc_adminvergabe;";

	class controlsbackground {
		
		class background: Life_RscText
		{
			idc = -1;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.489844 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class title: Life_RscText
		{
			idc = -1;
			text = "Vergabemenü"; 
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class lizenztitel: Life_RscText
		{
			idc = -1;
			text = "Lizenzen"; 
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class mengetitle: Life_RscText
		{
			idc = -1;
			text = "Menge:"; 
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class playertitle: Life_RscText
		{
			idc = -1;
			text = "Spielerliste"; 
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class itemtitle: Life_RscText
		{
			idc = -1;
			text = "Gegenstände"; 
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class toall: Life_RscText
		{
			idc = -1;
			text = "An alle:"; 
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {

		class playerlist: Life_RscListbox
		{
			idc = 9101;
			sizeEx = 0.032;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0.2,0,0,0.5};
		};

		class vergebenbutton: Life_RscButtonMenu
		{
			idc = 9102;
			text = "Level setzen";
			onButtonClick="[1] call life_fnc_adminvergabe;";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class levelauswahl: Life_RscCombo
		{
			idc = 9103;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class itemliste: Life_RscListbox
		{
			idc = 9104;
			sizeEx = 0.032;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class itemvergabebutton: Life_RscButtonMenu
		{
			idc = 9105;
			text = "Gegenstand versenden";
			onButtonClick="[2] call life_fnc_adminvergabe;";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class mengeneingabe: Life_RscEdit
		{
			idc = 9106;
			text = "1";
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class toallbox: Life_RscCheckbox2
		{
			idc = 9107;
			columns = 1;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lizenzbutton: Life_RscButtonMenu
		{
			idc = 9108;
			text = "Lizenz vergeben";
			onButtonClick="[3] call life_fnc_adminvergabe;";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class lizenzliste: Life_RscListbox
		{
			idc = 9109;
			sizeEx = 0.032;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class trueorfalse: Life_RscCombo
		{
			idc = 9110;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class close: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zurück";
			OnButtonClick="closedialog 0;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.4,0,0,0.5};
		};
	};
};