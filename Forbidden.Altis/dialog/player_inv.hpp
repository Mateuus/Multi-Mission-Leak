#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
	class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_PM_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			
			x = 0.62; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_Licenses";
			sizeEx = 0.04;
			
			x = 0.336; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.26;
			w = 0.219; h = 0.04;
		};
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.62; y = 0.30;
			w = 0.275; h = 0.3;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.12; y = 0.42;
			w = 0.18; h = 0.03;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.12; y = 0.46;
			w = 0.18; h = 0.03;
		};
		
		class timePlayed : Life_RscText
		{
			idc = 2027;
			text = "Speltid på Publiclir:";
			sizeEx = 0.03;
			x = 0.105; y = 0.55;
			w = 0.229; h = 0.04;
		};
		
		class timePlayedd : Life_RscText
		{
			idc = 2028;
			text = "timmar";
			sizeEx = 0.03;
			x = 0.105; y = 0.59;
			w = 0.219; h = 0.04;
		};
		
		class randomNumber : Life_RscButtonMenu
		{
			idc = 2079;
			text = "Random nummer";
			tooltip = "Skapa slumpmässiga nummer 1-100 för medlemmarna i din grupp/gäng.";
			sizeEx = 0.03;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bwnliedddtvjqmirddirmpmtqbpcunfhywrfhuqeplasbkaapzz";
			x = 0.12; y = 0.65;
			w = 0.15; h = 0.036;
		};
		
		
		
		
		
		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_itmapoybwilfpdjsbxrsjupmpxoaeolmifhnzrusugzrybqcbr";
			sizeEx = 0.025;
			x = 0.135; y = 0.50;
			w = 0.13; h = 0.036;
		};
		
		class itemEdit : Life_RscEdit {
		
		idc = item_edit;
		
		text = "1";
		sizeEx = 0.030;
		x = 0.62; y = 0.61;
		w = 0.275; h = 0.03;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.62; y = 0.65;
			w = 0.275; h = 0.03;
		};
		
		
		class DropButton : life_RscButtonMenu {
			
			idc = 2002;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_oxepxajjptxbfxyehxmzlceqwpbsujnzdohwmxbnkzeiwnwhyjbfqseck;";
			
			x = 0.765;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class UseButton : life_RscButtonMenu {
			
			text = "$STR_Global_Use";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_ivxofinueqziecycbekluhofkczciocqfbtszqzqrklcltjyatsq;";
			
			x = 0.62;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class RemoveButton : life_RscButtonMenu {
			
			text = "$STR_Global_Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_vpxywaovfestazplhlkzriuyxljsiustgeosrwaldqewnsrelspjbhdh;";
			
			x = 0.475;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSettings : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Settings";
			onButtonClick = "[] call life_fnc_vobwagbtjuupbxsfdznvifudpvkhxogbktqcddrytzqorayefmmidgclls;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			text = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_roariatzvviywmfdfyzhgcseyyrdohvwdklercumgnzhxpzstiszhlvd;};};";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			w = 0.28;
			h = 0.38;
			x = 0.34;
			y = 0.30;
			
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			text = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_eebpyipxavtdidwbfjlavizadjdsfqpgmxbrnizhgidruoxggslmnncqdm";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonMarket : Life_RscButtonMenu {
			idc = 2013;
			text = "Market";
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			text = "$STR_PM_CellPhone";
			onButtonClick = "[] spawn life_fnc_cagwmqcpkuzvzxcfkvhomkbqrapdrbbrpdmdclfibznsfojperah";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonPerks : Life_RscButtonMenu {
			idc = 2074;
			text = "Perks";
			onButtonClick = "[] spawn life_fnc_kfizovkclsepuqyxduwtsaojyaeefeiujxzrfplqjuttzxlibkjpqs";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonAirDrop : Life_RscButtonMenu {
			idc = 2021;
			text = "Airdrop";
			onButtonClick = "[] spawn life_fnc_ltoaejdyrfktmwyqipgzlygoejcobxflfvmeovyqxbzuuoilymjubajkei;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonCrafting : Life_RscButtonMenu {
			idc = 2098;
			text = "Hantverk";
			onButtonClick = "createDialog ""Life_craft"";";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSyncData : life_RscButtonMenu {
			idc = -1;
			
			text = "$STR_PM_SyncData";
			onButtonClick = "[] call SOCK_fnc_demswmrfrwpviwopoizhetpzzbkbpfbctlgwfgnvnllzoqeotol;";
			x = 0.1;
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};