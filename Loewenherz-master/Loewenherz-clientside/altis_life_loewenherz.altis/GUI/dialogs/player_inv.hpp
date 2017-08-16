#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {

		class TabletBCKGRND: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0195705;
			y = -0.104647;
			w = 1.08561;
			h = 1.18714;

		};

		class weight : lhm_RscText {
			style = 1;
			idc = carry_weight;
			sizeEx = 0.027;
			text = "";
			x = 0.653535;
			y = 0.126734;
			w = 0.167045;
			h = 0.026532;
		};
		class PictureKey: lhm_RscPicture
		{
			idc = 1201;
			text = "core\textures\icons\Menu\key.paa";
			x = 0.497475;
			y = 0.184377;
			w = 0.0875;
			h = 0.1;
		};
		class Picturegang: lhm_RscPicture
		{
			idc = 1202;
			text = "core\textures\icons\Menu\gang.paa";
			x = 0.372348;
			y = 0.344108;
			w = 0.0875;
			h = 0.1;
		};
		class Picturesettings: lhm_RscPicture
		{
			idc = 1203;
			text = "core\textures\icons\Menu\config.paa";
			x = 0.373864;
			y = 0.182761;
			w = 0.0875;
			h = 0.1;
		};
		class Picturemarkt: lhm_RscPicture
		{
			idc = 1204;
			text = "core\textures\icons\Menu\markt.paa";
			x = 0.120581;
			y = 0.345117;
			w = 0.0875;
			h = 0.1;
		};
		
		class PictureMarker: lhm_RscPicture
		{
			idc = 1399;
			text = "core\textures\icons\Menu\marker.paa";
			x = 0.120581;
			y = 0.503568;
			w = 0.0875;
			h = 0.1;
		};
		
		class PictureDonator: lhm_RscPicture
		{
			idc = 5777;
			text = "core\textures\icons\Menu\donator.paa";
			x = 0.246212;
			y = 0.503568;
			w = 0.0875;
			h = 0.1;
		};
		class PictureSync: lhm_RscPicture
		{
			idc = 1205;
			text = "core\textures\icons\Menu\sync.paa";
			x = 0.491162;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
		class PictureClose: lhm_RscPicture
		{
			idc = 1206;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.120581;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
		class PictureSMS: lhm_RscPicture
		{
			idc = 1207;
			text = "core\textures\icons\Menu\sms.paa";
			x = 0.246591;
			y = 0.184579;
			w = 0.0875;
			h = 0.1;
		};
		class PictureAdmin: lhm_RscPicture
		{
			idc = 1208;
			text = "core\textures\icons\Menu\admin.paa";
			x = 0.497096;
			y = 0.342626;
			w = 0.0875;
			h = 0.1;
		};

		class PictureSkills: lhm_RscPicture
		{
			idc = 1209;
			text = "core\textures\icons\Menu\crafting.paa";
			x = 0.120581;
			y = 0.186666;
			w = 0.0875;
			h = 0.1;
		};

		class PictureLizenzen: lhm_RscPicture
		{
			idc = 9999;
			text = "core\textures\icons\Menu\Lizenzen.paa";
			x = 0.246212;
			y = 0.345118;
			w = 0.0875;
			h = 0.1;
		};


		class moneyStatusInfo : lhm_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.676263;
			y = 0.609495;
			w = 0.273737;
			h = 0.106734;
		};

	};

	class controls {

		class itemHeader : lhm_RscText
		{
			idc = -1;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;

			x = 0.684343;
			y = 0.166667;
			w = 0.263131;
			h = 0.0265319;
		};

		//class licenseHeader : lhm_RscText
		//{
		//	idc = -1;
		//	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		//	text = "$STR_PM_Licenses";
		//	sizeEx = 0.04;

		//	x = 0.281187;
		//	y = 0.165925;
		//	w = 0.264394;
		//	h = 0.0282154;
		//};

		class moneySHeader : lhm_RscText
		{
			idc = -1;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;

			x = 0.680682;
			y = 0.577508;
			w = 0.264141;
			h = 0.0242425;
		};

		class TimeText: lhm_RscText
		{
			idc = 8888;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};

		class itemList : lhm_RscListBox
		{
			idc = item_list;
			sizeEx = 0.030;

			x = 0.678788;
			y = 0.201482;
			w = 0.271212;
			h = 0.204848;
		};

		class moneyEdit : lhm_RscEdit
		{
			idc = 2018;

			text = "1";
			sizeEx = 0.030;
			x = 0.682071;
			y = 0.725724;
			w = 0.263384;
			h = 0.0298991;
		};

		class NearPlayers : lhm_RscCombo
		{
			idc = 2022;

			x = 0.680808;
			y = 0.763838;
			w = 0.266035;
			h = 0.029899;
		};

		class moneyDrop : lhm_RscButtonMenu
		{
			idc = 2001;
			text = "$STR_Global_Give";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.751137;
			y = 0.799192;
			w = 0.1125;
			h = 0.04;
		};

		class itemEdit : lhm_RscEdit {

			idc = item_edit;

			text = "1";
			sizeEx = 0.030;
			x = 0.682324;
			y = 0.410774;
			w = 0.268687;
			h = 0.0332658;

		};
		class iNearPlayers : lhm_RscCombo
		{
			idc = 2023;

			x = 0.683459;
			y = 0.445253;
			w = 0.266667;
			h = 0.0343433;
		};
		/*
		Disabled till it can be redone
		class moneyInput: lhm_RscCombo {

			idc = money_value;

			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/

		class DropButton : lhm_RscButtonMenu {

			idc = 2002;
			text = "$STR_Global_Give";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_giveItem;";

			x = 0.820833;
			y = 0.482627;
			w = 0.125;
			h = 0.04;

		};

		class UseButton : lhm_RscButtonMenu {

			text = "$STR_Global_Use";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_useItem;";

			x = 0.681818;
			y = 0.483164;
			w = 0.125;
			h = 0.04;

		};

		class RemoveButton : lhm_RscButtonMenu {

			text = "$STR_Global_Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if (!(player getVariable [""restrained"", false]))then{[] call lhm_fnc_removeItem;}else{hint ""Du kannst das nicht gefesselt entfernen"";};";

			x = 0.756314;
			y = 0.525253;
			w = 0.125;
			h = 0.04;

		};
		/*
		Disabled till it can be redone
		class DropcButton : lhm_RscButtonMenu {

			text = "Drop Money";
			onButtonClick = "[] execVM 'player_system\money_fnc.sqf'";

			x = 0.13; y = 0.4;
			w = 0.135; h = 0.05;

		};
		*/

		class ButtonClose : lhm_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};

		class ButtonLicenses : lhm_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "Lizenzen";
			onButtonClick = "[] spawn lhm_fnc_licenseDialog;";
			x = 0.241161;
			y = 0.346801;
			w = 0.1;
			h = 0.1;
		};

		class ButtonSettings : lhm_RscButtonSilent {
			idc = -1;
			tooltip = "$STR_Global_Settings";
			onButtonClick = "[] call lhm_fnc_settingsMenu;";
			x = 0.365656;
			y = 0.179865;
			w = 0.1;
			h = 0.1;
		};

		class ButtonMyGang : lhm_RscButtonSilent {
			idc = 2011;
			tooltip = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""lhm_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""lhm_Create_Gang_Diag"";} else {[] spawn lhm_fnc_gangMenu;};};";
			x = 0.364015;
			y = 0.343232;
			w = 0.1;
			h = 0.1;
		};

		//class Licenses_Menu : lhm_RscControlsGroup
		//{
		//	idc = -1;
		//	x = 0.281313;
		//	y = 0.206532;
		//	w = 0.265025;
		//	h = 0.468687;
		//
		//	class Controls
		//	{
		//		class lhm_Licenses : lhm_RscStructuredText
		//		{
		//			idc = 2014;
		//			sizeEx = 0.020;
		//			text = "";
		//			x = 0;
		//			y = 0;
		//			w = 0.265025; h = 0.98;
		//		};
		//	};
		//};

		//class ButtonGangList : lhm_RscButtonMenu {
			//idc = 2012;
			//text = "$STR_PM_WantedList";
			//onButtonClick = "[] call lhm_fnc_wantedMenu";
			//x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			//y = 0.8 - (1 / 25);
			//w = (6.25 / 40);
		//	h = (1 / 25);
		//};

		class ButtonKeys : lhm_RscButtonSilent {
			idc = 2013;
			tooltip = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""lhm_key_management"";";
			x = 0.494318;
			y = 0.183232;
			w = 0.1;
			h = 0.1;
		};

		class ButtonCell : lhm_RscButtonSilent {
			idc = 2014;
			tooltip = "$STR_PM_CellPhone";
			//onButtonClick = "createDialog ""lhm_cell_phone"";"; // LHM
			onButtonClick = "if (!(player getVariable [""restrained"", false]))then{createDialog ""lhm_my_smartphone"";}else{hint ""Du kommst gefesselt nicht an dein Handy ran!"";};"; // LHM
			x = 0.239646;
			y = 0.184714;
			w = 0.1;
			h = 0.1;
		};

		class ButtonAdminMenu : lhm_RscButtonSilent {
			idc = 2021;
			tooltip = "$STR_PM_AdminMenu";
			onButtonClick = "closeDialog 0; execVM ""addons\admin_menu\admin_menu_fill.sqf"";";
			x = 0.489773;
			y = 0.346599;
			w = 0.1;
			h = 0.1;
		};

		class ButtonSyncData : lhm_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "$STR_PM_SyncData";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.48447;
			y = 0.746465;
			w = 0.1;
			h = 0.1;
		};

		//class helpmenu : lhm_RscButtonMenu {
		//	idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			//text = "Hilfe";
			//onButtonClick = "[] spawn {closeDialog 0; sleep 0.01;[] call lhm_fnc_openInfoMenu;};";
			//x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			//y = 0.805;
		//	w = (6.25 / 40);
			//h = (1 / 25);
		//};
		// LHM ECO SYSTEM //
		class ButtonMarket : lhm_RscButtonSilent {
			idc = -1;
			//text = "$STR_PM_Market";
			tooltip = "Market";
			onButtonClick = "[] spawn lhm_fnc_openMarketView;";
			x = 0.115404;
			y = 0.347205;
			w = 0.1;
			h = 0.1;
		}; // LHM ECO SYSTEM //
		
		class ButtonMarker : lhm_RscButtonSilent {
			idc = -1;
			
			tooltip = "Marker Einstellungen";
			onButtonClick = "[] call lhm_fnc_map_Marker_Menu;";
			x = 0.115404;
			y = 0.508031;
			w = 0.1;
			h = 0.1;
		};
		
		class ButtonDonator : lhm_RscButtonSilent {
			idc = 5574;
			
			tooltip = "Donator";
			onButtonClick = "[] spawn lhm_fnc_RANK_MENU_open;";
			x = 0.241161;
			y = 0.508031;
			w = 0.1;
			h = 0.1;
		};
		// papabears-persistent-proficiency-system //
		class ProfButton : lhm_RscButtonSilent {
			idc = -1;
			tooltip = "Skills";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_profSetup;";
			x = 0.116793;
			y = 0.186397;
			w = 0.1;
			h = 0.1;
		};
		// papabears-persistent-proficiency-system //
	};
};