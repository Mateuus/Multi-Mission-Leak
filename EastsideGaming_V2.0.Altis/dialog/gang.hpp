class Life_My_Gang_Diag {
    idd = 2620;
    name= "life_my_gang_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
				class bg_pic: Life_RscPicture
				{
					idc = -1;
					text = "texture\misc\bg_menu.paa";
					x = 0.17 * safezoneW + safezoneX;
					y = 0.115 * safezoneH + safezoneY;
					w = 0.665156 * safezoneW;
					h = 0.693 * safezoneH;
				};
				class title_header: Life_RscStructuredText
				{
					idc = -1;
					text = "<t font='PuristaBold' size='1.5'>Gangübersicht // Gangverwaltung</t>";
					x = 0.175156 * safezoneW + safezoneX;
					y = 0.126 * safezoneH + safezoneY;
					w = 0.262969 * safezoneW;
					h = 0.044 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
		};

		class controls {
				class btn_close: Life_RscButtonMenu
				{
					idc = -1;
					text = "Schliessen";
					x = 0.7475 * safezoneW + safezoneX;
					y = 0.764 * safezoneH + safezoneY;
					w = 0.0773437 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "closeDialog 0; [] call life_fnc_p_updateMenu;";
					class Attributes {
						align = "center";
					};
				};
				class GangMemberList: Life_RscListbox
				{
					idc = 2621;
					text = "";
					sizeEx = 0.035;
					x = 0.180312 * safezoneW + safezoneX;
					y = 0.214 * safezoneH + safezoneY;
					w = 0.232031 * safezoneW;
					h = 0.44 * safezoneH;
				};
				class GangLeave: Life_RscButtonMenu
				{
					idc = -1;
					text = "Gang Verlassen"; //--- ToDo: Localize;
					x = 0.427812 * safezoneW + safezoneX;
					y = 0.214 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] call life_fnc_gangLeave";
					class Attributes {
						align = "center";
					};
				};
				class GangLock: Life_RscButtonMenu
				{
					idc = 2622;
					text = "Slots erweitern"; //--- ToDo: Localize;
					x = 0.587656 * safezoneW + safezoneX;
					y = 0.214 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] spawn life_fnc_gangUpgrade";
					class Attributes {
						align = "center";
					};
				};
				class GangKick: Life_RscButtonMenu
				{
					idc = 2624;
					text = "Mitglied kicken"; //--- ToDo: Localize;
					x = 0.427812 * safezoneW + safezoneX;
					y = 0.28 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] call life_fnc_gangKick";
					class Attributes {
						align = "center";
					};
				};
				class GangLeader: Life_RscButtonMenu
				{
					idc = 2625;
					text = "Neuer Leader"; //--- ToDo: Localize;
					x = 0.587656 * safezoneW + safezoneX;
					y = 0.28 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] spawn life_fnc_gangNewLeader";
					class Attributes {
						align = "center";
					};
				};
				class InviteMember: Life_RscButtonMenu
				{
					idc = 2630;
					text = "Spieler einladen"; //--- ToDo: Localize;
					x = 0.427812 * safezoneW + safezoneX;
					y = 0.412 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
					class Attributes {
						align = "center";
					};
				};
				class DisbandGang: Life_RscButtonMenu
				{
					idc = 2631;
					text = "Gang auflösen"; //--- ToDo: Localize;
					x = 0.427812 * safezoneW + safezoneX;
					y = 0.346 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] spawn life_fnc_gangDisband";
					class Attributes {
						align = "center";
					};
				};
				class Players: Life_RscListbox
				{
					idc = 2632;
					text = "";
					x = 0.427812 * safezoneW + safezoneX;
					y = 0.456 * safezoneH + safezoneY;
					w = 0.221719 * safezoneW;
					h = 0.198 * safezoneH;
					sizeEx = 0.035;
				};
				class GangBank: Life_RscTitle
				{
					idc = 601;
					text = "";
					x = 0.180312 * safezoneW + safezoneX;
					y = 0.676 * safezoneH + safezoneY;
					w = 0.226875 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class MaxMember: Life_RscTitle
				{
					idc = 1001;
					text = "";
					x = 0.180312 * safezoneW + safezoneX;
					y = 0.709 * safezoneH + safezoneY;
					w = 0.226875 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class GangName: Life_RscTitle
				{
					idc = 1002;
					text = "";
					x = 0.180312 * safezoneW + safezoneX;
					y = 0.742 * safezoneH + safezoneY;
					w = 0.226875 * safezoneW;
					h = 0.022 * safezoneH;
				};
		};
};

class Life_Create_Gang_Diag {
    idd = 2520;
    name= "life_my_gang_menu_create";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format [localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";

    class controlsBackground {
				class bg_pic: Life_RscPicture
				{
					idc = -1;
					text = "texture\misc\bg_menu.paa";
					x = 0.319531 * safezoneW + safezoneX;
					y = 0.291 * safezoneH + safezoneY;
					w = 0.365156 * safezoneW;
					h = 0.393 * safezoneH;
				};
				class title_header: Life_RscStructuredText
				{
					idc = -1;
					text = "<t font='PuristaBold' size='1.5'>Gang erstellen</t>"; //--- ToDo: Localize;
					x = 0.319531 * safezoneW + safezoneX;
					y = 0.291 * safezoneH + safezoneY;
					w = 0.242344 * safezoneW;
					h = 0.044 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
		};

		class controls {
				class btn_close: Life_RscButtonMenu
				{
					idc = -1;
					text = "Schliessen"; //--- ToDo: Localize;
					x = 0.597969 * safezoneW + safezoneX;
					y = 0.643 * safezoneH + safezoneY;
					w = 0.0773437 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
					class Attributes {
						align = "center";
					};
				};
				class InfoMsg: Life_RscStructuredText
				{
					idc = 2523;
					sizeEx = 0.020;
					text = "";
					x = 0.381406 * safezoneW + safezoneX;
					y = 0.368 * safezoneH + safezoneY;
					w = 0.20625 * safezoneW;
					h = 0.077 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
				class CreateGangText: Life_RscEdit
				{
					idc = 2522;
					text = "$STR_Gang_YGN";
					x = 0.37625 * safezoneW + safezoneX;
					y = 0.456 * safezoneH + safezoneY;
					w = 0.221719 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class GangCreateField: Life_RscButtonMenu
				{
					idc = -1;
					text = "Gang erstellen"; //--- ToDo: Localize;
					x = 0.422656 * safezoneW + safezoneX;
					y = 0.5 * safezoneH + safezoneY;
					w = 0.12375 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] call life_fnc_createGang";
					class Attributes {
						align = "center";
						font = "PuristaBold";
					};
				};
		};
};
