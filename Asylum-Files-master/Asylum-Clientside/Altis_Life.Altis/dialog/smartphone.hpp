class smartphone {

	idd = 90000;
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBackground:Life_RscPictureKeepAspect {
			idc = -1;
			text = "images\phone.paa";			
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
	};
	
	class controls
	{
	
		class TextTime : Life_RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.165;
			w = 1; h = 0.05;
		};
		
		class TextStatusLeft : Life_RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.165;
			w = 0.3; h = 0.05;
		};
		
		class TextStatusRight : Life_RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.165;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};
		
		class IconSyncData : Life_RscStructuredText {
			idc = 90010;
			x = 0.5 - (0.08 * 2);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class IconMoney : Life_RscStructuredText {
			idc = 90015;
			x = 0.5 - (0.08 * 1);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class IconMessage : Life_RscStructuredText {
			idc = 90020;
			x = 0.5;
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class IconInventory : Life_RscStructuredText {
			idc = 90025;
			x = 0.5 + (0.08 * 1);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class IconOne : Life_RscStructuredText {
			idc = 90500;
			x = 0.5 - (0.08 * 2);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class IconTwo : Life_RscStructuredText {
			idc = 90501;
			x = 0.5 - (0.08 * 1);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class IconThree : Life_RscStructuredText {
			idc = 90502;
			x = 0.5;
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class IconFour : Life_RscStructuredText {
			idc = 90503;
			x = 0.5 + (0.08 * 1);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class IconFive : Life_RscStructuredText {
			idc = 90504;
			x = 0.5 - (0.08 * 2);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class IconSix : Life_RscStructuredText {
			idc = 90505;
			x = 0.5 - (0.08 * 1);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class IconSeven : Life_RscStructuredText {
			idc = 90506;
			x = 0.5;
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class IconEight : Life_RscStructuredText {
			idc = 90507;
			x = 0.5 + (0.08 * 1);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};

		class IconNine : Life_RscStructuredText {
			idc = 90508;
			x = 0.5 - (0.08 * 2);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class IconTen : Life_RscStructuredText {
			idc = 90509;
			x = 0.5 - (0.08 * 1);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class IconEleven : Life_RscStructuredText {
			idc = 90510;
			x = 0.5;
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class IconTwelve : Life_RscStructuredText {
			idc = 90511;
			x = 0.5 + (0.08 * 1);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class IconThirteen : Life_RscStructuredText {
			idc = 90512;
			x = 0.5 - (0.08 * 2);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class IconFourteen : Life_RscStructuredText {
			idc = 90513;
			x = 0.5 - (0.08 * 1);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class IconFifteen : Life_RscStructuredText {
			idc = 90514;
			x = 0.5;
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class IconSixteen : Life_RscStructuredText {
			idc = 90515;
			x = 0.5 + (0.08 * 1);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Close your smartphone";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1 - 0.15;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};
		
		class ButtonCell : Life_RscButtonInvisible {
			idc = 90040;
			text = "";
			onButtonClick = "if (player getVariable[""restrained"",false]) then { hint ""You cannot open your cell phone when you're restrained!""; } else { createDialog ""Life_cell_phone""; };";
			tooltip = "Send text messages to players or police";
			x = 0.5;
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};

		class ButtonSync : Life_RscButtonInvisible {
			idc = 90045;
			text = "";
			onButtonClick = "[] call life_fnc_syncData;";
			tooltip = "Update server with your current character data";
			x = 0.5 - (0.08 * 2);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonInventory : Life_RscButtonInvisible {
			idc = 90050;
			text = "";
			onButtonClick = "createDialog ""life_cell_phone_call""";
			tooltip = "Phone call with another person";
			x = 0.5 + (0.08 * 1);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonMoney : Life_RscButtonInvisible {
			idc = 90045;
			text = "";
			onButtonClick = "createDialog ""life_money_menu""";
			tooltip = "Trade your cash on hand";
			x = 0.5 - (0.08 * 1);
			y = 1 - 0.28;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonOne : Life_RscButtonInvisible {
			idc = 90600;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 0)";
			x = 0.5 - (0.08 * 2);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonTwo : Life_RscButtonInvisible {
			idc = 90601;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 1)";
			x = 0.5 - (0.08 * 1);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonThree : Life_RscButtonInvisible {
			idc = 90602;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 2)";
			x = 0.5;
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonFour : Life_RscButtonInvisible {
			idc = 90603;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 3)";
			x = 0.5 + (0.08 * 1);
			y = 0.23;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonFive : Life_RscButtonInvisible {
			idc = 90604;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 4)";
			x = 0.5 - (0.08 * 2);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonSix : Life_RscButtonInvisible {
			idc = 90605;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 5)";
			x = 0.5 - (0.08 * 1);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonSeven : Life_RscButtonInvisible {
			idc = 90606;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 6)";
			x = 0.5;
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonEight : Life_RscButtonInvisible {
			idc = 90607;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 7)";
			x = 0.5 + (0.08 * 1);
			y = 0.35;
			w = 0.08;
			h = 0.11;
		};

		class ButtonNine : Life_RscButtonInvisible {
			idc = 90608;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 8)";
			x = 0.5 - (0.08 * 2);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonTen : Life_RscButtonInvisible {
			idc = 90609;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 9)";
			x = 0.5 - (0.08 * 1);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonEleven : Life_RscButtonInvisible {
			idc = 90610;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 10)";
			x = 0.5;
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonTwelve : Life_RscButtonInvisible {
			idc = 90611;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 11)";
			x = 0.5 + (0.08 * 1);
			y = 0.47;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonThirteen : Life_RscButtonInvisible {
			idc = 90612;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 12)";
			x = 0.5 - (0.08 * 2);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonFourteen : Life_RscButtonInvisible {
			idc = 90613;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 13)";
			x = 0.5 - (0.08 * 1);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonFifteen : Life_RscButtonInvisible {
			idc = 90614;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 14)";
			x = 0.5;
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
		class ButtonSixteen : Life_RscButtonInvisible {
			idc = 90615;
			text = "";
			onButtonClick = "call compile (life_phone_actions select 15)";
			x = 0.5 + (0.08 * 1);
			y = 0.59;
			w = 0.08;
			h = 0.11;
		};
		
	};
};