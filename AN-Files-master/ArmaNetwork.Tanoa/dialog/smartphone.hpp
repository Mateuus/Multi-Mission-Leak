////////////////////////////////////////////////////////
// Author: R4thbone
// Graphics & Design: Jeims
// For: ArmA.Network Exclusively
////////////////////////////////////////////////////////
class smartphone {

	idd = 90000;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {

		class Life_RscPicture_1200: Life_RscPictureKeepAspect
		{
			idc = 1200;
			//moving = 1;
			text = "\sndimg\icons\Background.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1201: Life_RscPicture
		{
			idc = 1201;
			text = "\sndimg\icons\Info.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1202: Life_RscPicture
		{
			idc = 1202;
			text = "\sndimg\icons\iGang.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class iGang_Overlay: Life_RscPicture
		{
			idc = 12021;
			text = "\sndimg\icons\iGang_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1203: Life_RscPicture
		{
			idc = 1203;
			text = "\sndimg\icons\Backpack.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1204: Life_RscPicture
		{
			idc = 1204;
			text = "\sndimg\icons\Banking.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1205: Life_RscPicture
		{
			idc = 1205;
			text = "\sndimg\icons\Actions.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1206: Life_RscPicture
		{
			idc = 1206;
			text = "\sndimg\icons\Crafting.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Crafting_Overlay: Life_RscPicture
		{
			idc = 12061;
			text = "\sndimg\icons\Crafting_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1207: Life_RscPicture
		{
			idc = 1207;
			text = "\sndimg\icons\Barriers.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Barriers_Overlay: Life_RscPicture
		{
			idc = 12071;
			text = "\sndimg\icons\Barriers_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1208: Life_RscPicture
		{
			idc = 1208;
			text = "\sndimg\icons\Keys.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1209: Life_RscPicture
		{
			idc = 1209;
			text = "\sndimg\icons\Licenses.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1210: Life_RscPicture
		{
			idc = 1210;
			text = "\sndimg\icons\Market.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Market_Overlay: Life_RscPicture
		{
			idc = 12101;
			text = "\sndimg\icons\Market_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1211: Life_RscPicture
		{
			idc = 1211;
			text = "\sndimg\icons\Messages.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1212: Life_RscPicture
		{
			idc = 1212;
			text = "\sndimg\icons\Settings.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1213: Life_RscPicture
		{
			idc = 1213;
			text = "\sndimg\icons\Skills.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Skills_Overlay: Life_RscPicture
		{
			idc = 12131;
			text = "\sndimg\icons\Skills_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1214: Life_RscPicture
		{
			idc = 1214;
			text = "\sndimg\icons\Sync_Data.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1215: Life_RscPicture
		{
			idc = 1215;
			text = "\sndimg\icons\Taxi.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Taxi_Overlay: Life_RscPicture
		{
			idc = 12151;
			text = "\sndimg\icons\Taxi_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1216: Life_RscPicture
		{
			idc = 1216;
			text = "\sndimg\icons\Terror.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Terror_Overlay: Life_RscPicture
		{
			idc = 12161;
			text = "\sndimg\icons\Terror_Overlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Life_RscPicture_1217: Life_RscPicture
		{
			idc = 1217;
			text = "\sndimg\icons\Wanted.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class RscPicture_1202: Life_RscPicture
		{
			idc = 1218;
			text = "\sndimg\icons\Admin.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class Admin_Overlay: Life_RscPicture
		{
			idc = 12181;
			text = "\sndimg\icons\AdminOverlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class RscPicture_1203: Life_RscPicture
		{
			idc = 1219;
			text = "\sndimg\icons\CallBackup.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
		class CallBackup_Overlay: Life_RscPicture
		{
			idc = 12191;
			text = "\sndimg\icons\CallBackupOverlay.paa";
			x = -0.0625;
			y = -0.3;
			w = 1.1375;
			h = 1.5;
			colorBackground[] = {0, 0, 0, 0};
		};
	};
	class controls {
		class Life_RscButtonInvisible_2400: Life_RscButtonInvisible
		{
			idc = 2400;
			onButtonClick = "createDialog ""Life_key_management"";";
			tooltip = "View and share your car keys";
			x = 0.3375;
			y = 0.14;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2401: Life_RscButtonInvisible
		{
			idc = 2401;
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gangLeader""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_hucruphu;};};";
			tooltip = "Here you can create a gang, share funds, build bases, etc";
			x = 0.425;
			y = 0.14;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2402: Life_RscButtonInvisible
		{
			idc = 2402;
			onButtonClick = "if(playerside !=west) then {hint ""You are not a law enforcement""; } else {[] execVM 'core\functions\fn_terrorAttack.sqf'};";
			tooltip = "Police Only: Announce Terrorism";
			x = 0.525;
			y = 0.14;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2403: Life_RscButtonInvisible
		{
			idc = 2403;
			onButtonClick = "createDialog ""life_inventory_menu"";";
			tooltip = "View and manage your virtual items in your inventory";
			x = 0.625;
			y = 0.14;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2404: Life_RscButtonInvisible
		{
			idc = 2404;
			onButtonClick = "if(playerside !=civilian) then {hint ""You are not a civilian""; } else { createDialog ""Life_craft""};";
			tooltip = "Crafting Menu";
			x = 0.3375;
			y = 0.28;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2405: Life_RscButtonInvisible
		{
			idc = 2405;
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			tooltip = "Check the Economy";
			x = 0.4375;
			y = 0.28;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2406: Life_RscButtonInvisible
		{
			idc = 2406;
			onButtonClick = "createDialog ""life_skillMenu"";";
			tooltip = "Talents and More";
			x = 0.525;
			y = 0.28;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2407: Life_RscButtonInvisible
		{
			idc = 2407;
			onButtonClick = "createDialog ""life_license_menu"";";
			tooltip = "Check your licenses";
			x = 0.625;
			y = 0.28;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2408: Life_RscButtonInvisible
		{
			idc = 2408;
			onButtonClick = "if(side player == west) then {[] call life_fnc_wantedMenu;} else {[] call life_fnc_quhepuprehu;closeDialog 0;}";
			tooltip = "View the list of current criminals";
			x = 0.3375;
			y = 0.4;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2409: Life_RscButtonInvisible
		{
			idc = 2409;
			onButtonClick = "[] spawn life_fnc_openTaxiMenu";
			tooltip = "Open the taxi menu";
			x = 0.4375;
			y = 0.4;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2410: Life_RscButtonInvisible
		{
			idc = 2410;
			onButtonClick = "[] spawn life_fnc_placeablesMenu;";
			tooltip = "Place and create roadblocks with this menu";
			x = 0.525;
			y = 0.4;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2411: Life_RscButtonInvisible
		{
			idc = 2411;
			onButtonClick = "createDialog ""life_moves_menu"";";
			tooltip = "Make your character preform actions";
			x = 0.625;
			y = 0.4;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2412: Life_RscButtonInvisible
		{
			idc = 2412;
			onButtonClick = "[0] spawn life_fnc_hunubrecr;";
			tooltip = "Open the Arma Network Information Panel";
			x = 0.3375;
			y = 0.54;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2413: Life_RscButtonInvisible
		{
			idc = 2413;
			onButtonClick = "[] call life_fnc_settingsMenu;";
			tooltip = "Modify your view settings and game settings";
			x = 0.3375;
			y = 0.8;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2414: Life_RscButtonInvisible
		{
			idc = 2414;
			onButtonClick = "[] call life_fnc_pawrahuza;";
			tooltip = "Save your data to the server";
			x = 0.425;
			y = 0.8;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2415: Life_RscButtonInvisible
		{
			idc = 2415;
			onButtonClick = "createDialog ""life_money_menu"";";
			tooltip = "Check and exchange your money";
			x = 0.525;
			y = 0.8;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2416: Life_RscButtonInvisible
		{
			idc = 2416;
			onButtonClick = "createDialog ""Life_my_smartphone"";";
			tooltip = "Send messages to other players or emergency services";
			x = 0.625;
			y = 0.8;
			w = 0.0625;
			h = 0.1;
		};
		class Life_RscButtonInvisible_2417: Life_RscButtonInvisible
		{
			idc = 2417;
			onButtonClick = "closeDialog 0;";
			tooltip = "Put Away Phone";
			x = 0.4;
			y = 0.92;
			w = 0.225;
			h = 0.06;
		};
		class RscButtonMenu_AdminMenu: Life_RscButtonInvisible
		{
			idc = 2418;
			tooltip = "Open Admin Menu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0.425;
			y = 0.54;
			w = 0.075;
			h = 0.08;
		};
		class RscButtonMenu_CallBackup: Life_RscButtonInvisible
		{
			idc = 2419;
			onButtonClick = "[] call life_fnc_callbackup";
			tooltip = "Call Backup to Your Current Location";
			x = 0.525;
			y = 0.54;
			w = 0.0625;
			h = 0.08;
		};
	};
};
