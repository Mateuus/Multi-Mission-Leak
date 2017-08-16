////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////

class Life_My_Gang_Diag {
idd = 2620;
name= "life_my_gang_menu";
movingEnable = false;
enableSimulation = true;
onLoad = "";

	class controlsBackground {
		class backgroundtitle: Life_RscText
		{
			idc = -1;
			text = "Gang Menu";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {
		class GangMemberList: Life_RscListbox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Gang Information"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Gang Members"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class inviteplayer: Life_RscButtonMenu
		{
			idc = 2630;
			text = "Invite Player"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscCombo_2100: Life_RscCombo
		{
			idc = 2632;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CloseButton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class disbandbutton: Life_RscButtonMenu
		{
			idc = 2631;
			text = "Disband Gang"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class kickbutton: Life_RscButtonMenu
		{
			idc = 2624;
			text = "Kick Member"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class setleaderbutton: Life_RscButtonMenu
		{
			idc = 2625;
			text = "Set Leader"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2638;
			text = "Rank Member Up"; //--- ToDo: Localize;
			onButtonClick = "[1] spawn life_fnc_gangRankPlayer;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2639;
			text = "Rank Member Down"; //--- ToDo: Localize;
			onButtonClick = "[-1] spawn life_fnc_gangRankPlayer;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = -1;
			text = "Leave Gang"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_gangLeave";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2408: Life_RscButtonMenu
		{
			idc = 2635;
			text = "Building Zones (CS)"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2640;
			text = "Remove Plot Pole (CS)"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2410: Life_RscButtonMenu
		{
			idc = 2650;
			text = "Set Invite Fee (CS)"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2411: Life_RscButtonMenu
		{
			idc = 2655;
			text = "Gang Transactions (CS)"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2412: Life_RscButtonMenu
		{
			idc = 2622;
			text = "Upgrade Gang Level"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gang_price)] call life_fnc_numberText]};";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};

	class controls {

		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangCreate;";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";

			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};
