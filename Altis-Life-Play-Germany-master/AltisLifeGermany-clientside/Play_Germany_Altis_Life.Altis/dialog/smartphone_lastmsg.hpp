class smartphone_lastmsg {

	idd = 88811;
	name = "life_my_telephone_menu2";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone_MSG;";
	
	class controlsBackground {
		class backgroundPhone: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\padfone_list_1024.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.726 * safezoneH;
		};
		
		class CloseButton1: Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
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
	
	class controls 
	{
	
		class MessageTitle: Life_RscTitle
		{
			idc = 88886;
			text = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.292 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class RandomTitle: Life_RscTitle
		{
			idc = 88890;
			text = "Nachricht wählen";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.3905 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class MessageList : Life_RscListNBox
		{
			idc = 88812;
			onLBSelChanged = "[(lbCurSel 88812)] call life_fnc_showMsg;";
			sizeEx = 0.03;
			columns[] = {0,0.3};
			x = 0.407188 * safezoneW + safezoneX;
			y = 0.314 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorText[] = { 0, 0, 0, 1 };
		};
		
		class TextShow: Life_RscControlsGroup {
			x = 0.407188 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.308 * safezoneH;
			
			class HScrollbar : HScrollbar {
				height = 0;
			};
			
			class controls {
				
				class showText: Life_RscStructuredText {
					idc = 88871;
					shadow = 0;
					x = 0 * safezoneW;
					y = 0.015 * safezoneH;
					w = 0.175313 * safezoneW;
					h = 0.297 * safezoneH;
					text = "";
					colorBackground[] = {0,0,0,0.5};
				};
			};
		};

		class DeleteMessages: Life_RscButtonMenu {
			idc = -1;
			text = "Alle Nachrichten Löschen";
			onButtonClick = "[3] call life_fnc_smartphone_MSG;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.7405 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {1,0,0,1};
			colorFocused[] = {0,0,0,0.4};
			color2[] = {1,0,0,1};
			colorDisabled[] = {-1,-1,-1,-1};	
			colorText[] = {1,0,0,1};
		};
	};
};