class ES_My_Gang_Diag {
	idd = 2620;
	name= "ES_my_gang_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\gang_menu.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

    class controls {
		class GangMemberList: ES_RscListbox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.033;
			font = "PuristaMedium";

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.319 * safezoneH;
		};
		class GangLeave: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_gangLeave";

			x = 0.556719 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Gang verlassen"; //--- ToDo: Localize;
		};

		class GangLock: ES_RscButtonMenu
		{
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn ES_fnc_gangUpgrade";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Upgraden"; //--- ToDo: Localize;
		};

		class GangKick: ES_RscButtonMenu
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_gangKick";

			x = 0.556719 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class GangLeader: ES_RscButtonMenu
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn ES_fnc_gangNewLeader";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Neuer Leader"; //--- ToDo: Localize;
		};

		class InviteMember: ES_RscButtonMenu
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn ES_fnc_gangInvitePlayer";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Spieler einladen"; //--- ToDo: Localize;
		};

		class DisbandGang: ES_RscButtonMenu
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn ES_fnc_gangDisband";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class ColorList: ES_RscCombo
		{
			idc = 2632;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class GangBank: ES_RscTitle
		{
			idc = 601;
			style = 1;
			text = "";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class CloseButtonKey: ES_RscButtonMenu
		{
		idc = -1;
		text = "$STR_Global_Close";
		onButtonClick = "closeDialog 0;";

		x = 0.293229 * safezoneW + safezoneX;
		y = 0.774944 * safezoneH + safezoneY;
		w = 0.111927 * safezoneW;
		h = 0.032074 * safezoneH;
		tooltip = "Schließen"; //--- ToDo: Localize;
		};

		class Title: ES_RscTitle
		{
			idc = 2629;
			style = 1;
			text = "";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Title_m: Title
		{
			idc = 9876;
			style = 1;
			text = "";

			y = 0.688 * safezoneH + safezoneY;
		};
	};
};

class ES_Create_Gang_Diag {
	idd = 2520;
	name= "ES_my_gang_menu_create";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'ES_Settings' >> 'gang_price'))] call ES_fnc_numberText]};";
	
	class controlsBackground {
		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\gangerstellen_menu.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {

		class InfoMsg: ES_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class GangCreateField: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_createGang";

			x = 0.407187 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CreateGangText: ES_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CloseLoadMenu: ES_RscButtonMenu
		{
		idc = -1;
		text = "$STR_Global_Close";
		onButtonClick = "closeDialog 0;";

		x = 0.293229 * safezoneW + safezoneX;
		y = 0.774944 * safezoneH + safezoneY;
		w = 0.111927 * safezoneW;
		h = 0.032074 * safezoneH;
		tooltip = "Schließen"; //--- ToDo: Localize;
		};
	};
};