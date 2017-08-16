class message_history {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[true] spawn life_fnc_showMsg";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};			
			idc = -1;
			x = 0.325;
			y = 0.2;
			w = 0.725;
			h = (1 / 25);
		};
		
	class MainBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.93};
			idc = -1;
			x = 0.325;
			y = 0.2 + (11 / 250);
			w = 0.725;
			h = 0.7 - (22 / 250);
		};
		
	class MessageTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = 0.325;
			y = 0.25;
			w = 0.7;
			h = (1 / 25);
		};
		
	class RandomTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.7;
			h = (1 / 25);
		};
	};
	
	class controls {
		
		class MessageTitle : Life_RscTitle {
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			idc = 88886;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.325;
			y = 0.25;
			w = 0.7;
			h = (1 / 25);
		};
		
		class RandomTitle : Life_RscTitle {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = 88890;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.7;
			h = (1 / 25);
		};
		
		class MessageList : Life_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[false,(lbCurSel 88882)] call life_fnc_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			x = 0.325;
			y = 0.25 + (1 / 25);
			w = 0.7;
			h = 0.3;
		};

		class TextShow : Life_RscControlsGroup {
			x = 0.325;
			y =  0.25 + 0.3 + (1 / 25) + (1 / 25);
			w =  0.7;
			h =  0.15;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : Life_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.69;//w = 0.7;
					h = 1;//h = 2.15;
				};
			};
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			text = "Message History";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.325;
			y = 0.2;
			w = 0.725;
			h = (1 / 25);
		};
		
		class CloseLoadMenu : Life_RscButtonMenu {
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.219 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};

};