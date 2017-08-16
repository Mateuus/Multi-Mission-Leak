#include "player_sys.sqf"

class playerSettings {

	idd = 5500;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
	};
	
	class controls {
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "textures\phone icons\message.paa";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "textures\phone icons\phone.paa";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "textures\phone icons\money.paa";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1204: RscPicture
		{
			idc = 1204;
			text = "textures\phone icons\sync.paa";
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1205: RscPicture
		{
			idc = 1205;
			text = "textures\phone icons\inventory.paa";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1206: RscPicture
		{
			idc = 2013;
			text = "textures\phone icons\keys.paa";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1207: RscPicture
		{
			idc = 3024;
			text = "textures\phone icons\talents.paa";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1208: RscPicture
		{
			idc = 1208;
			text = "textures\phone icons\licences.paa";
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1209: RscPicture
		{
			idc = 20003;
			text = "textures\phone icons\placeables.paa";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_12069: RscPicture
		{
			idc = 40003;
			text = "textures\phone icons\placeables.paa";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1210: RscPicture
		{
			idc = 2012;
			text = "textures\phone icons\wanted.paa";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1211: RscPicture
		{
			idc = 3025;
			text = "textures\phone icons\market.paa";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1212: RscPicture
		{
			idc = -1;
			text = "textures\phone icons\settings.paa";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1213: RscPicture
		{
			idc = 2021;
			text = "textures\phone icons\admin.paa";
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1214: RscPicture
		{
			idc = 2011;
			text = "textures\phone icons\gang.paa";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RscPicture_1215: RscPicture
		{
			idc = 9696;
			text = "textures\phone icons\bounty.paa";
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class ButtonInv: Life_RscButtonInvisible
		{
			idc = 1001;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_p_invopenMenu;";
			tooltip = "Inventory"; //--- ToDo: Localize;
		};
		class ButtonKeys: Life_RscButtonInvisible
		{
			idc = 1002;
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "createDialog ""Life_key_management"";";
			tooltip = "Keychain"; //--- ToDo: Localize;
		};
		class ButtonTalents: Life_RscButtonInvisible
		{
			idc = 1003;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
			tooltip = "Talents"; //--- ToDo: Localize;
		};
		class ButtonLicences: Life_RscButtonInvisible
		{
			idc = 1004;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_p_licencesopenMenu;";
			tooltip = "Licences"; //--- ToDo: Localize;
		};
		class ButtonSettings: Life_RscButtonInvisible
		{
			idc = 1005;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_settingsMenu;";
			tooltip = "Settings"; //--- ToDo: Localize;
		};
		class ButtonMarket: Life_RscButtonInvisible
		{
			idc = 1000;
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "createDialog ""life_dynmarket_prices"";"; 
			tooltip = "Market"; //--- ToDo: Localize;
		};
		class ButtonGang: Life_RscButtonInvisible
		{
			idc = 1006;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			tooltip = "My Gang"; //--- ToDo: Localize;
		};
		class ButtonBounty: Life_RscButtonInvisible
		{
			idc = 1007;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_bountyMenu;";
			tooltip = "Bounty List"; //--- ToDo: Localize;
		};
		class ButtonWanted: Life_RscButtonInvisible
		{
			idc = 1008;
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_wantedMenu";
			tooltip = "Wanted List"; //--- ToDo: Localize;
		};
		class ButtonPlaceables: Life_RscButtonInvisible
		{
			idc = 20004;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] spawn life_fnc_placeablesMenu; closeDialog 0;";
			tooltip = "Placeables"; //--- ToDo: Localize;
		};
		class ButtonPlaceablesMenuMEDIC: Life_RscButtonInvisible
		{
			idc = 40004;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] spawn life_fnc_placeablesMenuMEDIC; closeDialog 0;";
			tooltip = "Placeables"; //--- ToDo: Localize;
		};
		class ButtonAdmin: Life_RscButtonInvisible
		{
			idc = 2022;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "createDialog ""life_admin_menu"";";
			tooltip = "Admin"; //--- ToDo: Localize;
		};
		class ButtonMessage: Life_RscButtonInvisible
		{
			idc = 1011;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "createDialog ""Life_cell_phone"";";
			tooltip = "Text Message"; //--- ToDo: Localize;
		};
		class ButtonPhone: Life_RscButtonInvisible
		{
			idc = 1013;
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_radioPhone;";
			tooltip = "Phone Call"; //--- ToDo: Localize;
		};
		class ButtonMoney: Life_RscButtonInvisible
		{
			idc = 1014;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call life_fnc_p_moneyopenMenu;";
			tooltip = "Money"; //--- ToDo: Localize;
		};
		class ButtonSync: Life_RscButtonInvisible
		{
			idc = 1015;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = "Sync"; //--- ToDo: Localize;
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};