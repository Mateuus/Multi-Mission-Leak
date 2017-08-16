class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
		
		class Tablet: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\tablet.paa";
			x = -0.4125;
			y = -0.16;
			w = 1.825;
			h = 1.32;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};
		
		class gangtitle: Life_RscText
		{
			idc = -1;
			text = "Gangbook - Deine Gruppierungsplattform";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class membertitle: Life_RscText
		{
			idc = -1;
			text = "Mitglieder verwalten";
			x = 0.45;
			y = 0.44;
			w = 0.5375;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class upgradetitle: Life_RscText
		{
			idc = -1;
			text = "Upgrade und Kapazitätserweiterungen";
			x = 0.45;
			y = 0.76;
			w = 0.5375;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class gangkonto: Life_RscText
		{
			idc = -1;
			text = "Gruppierungskontostand:";
			x = 0.45;
			y = 0.2;
			w = 0.3125;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			idc = 2629;
			text = "";
			x = 0.45;
			y = 0.12;
			w = 0.5375;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.04;
			x = 0.0125;
			y = 0.12;
			w = 0.425;
			h = 0.84;
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "Gruppierung verlassen";
			onButtonClick = "[] spawn life_fnc_gangLeave";
			x = 0.45;
			y = 0.36;
			w = 0.3125;
			h = 0.04;
		};
		
		class GangLock : Life_RscButtonMenu 
		{
			idc = 2622;
			text = "Hauptquartier ausbauen";
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.45;
			y = 0.84;
			w = 0.3125;
			h = 0.04;
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 2624;
			text = "Mitglied rauswerfen";
			onButtonClick = "[] spawn life_fnc_gangKick";
			x = 0.45;
			y = 0.68;
			w = 0.3125;
			h = 0.04;
		};
		
		class GangLeader : Life_RscButtonMenu 
		{
			idc = 2625;
			text = "Zu Anführer ernennen";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.45;
			y = 0.52;
			w = 0.3125;
			h = 0.04;
		};
		
		class InviteMember : Life_RscButtonMenu
		{
			idc = 2630;
			text = "Mitglied einladen";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.45;
			y = 0.6;
			w = 0.3125;
			h = 0.04;
		};
		
		class DisbandGang : Life_RscButtonMenu
		{
			idc = 2631;
			text = "Gruppierung auflösen";
			
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.45;
			y = 0.28;
			w = 0.3125;
			h = 0.04;
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.775; 
			y = 0.6;
			w = 0.2125;
			h = 0.04;
		};
		
		class GangBank : Life_RscText {
			idc = 601;
			style = 1;
			text = "";
			x = 0.7875;
			y = 0.2;
			w = 0.2;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class clantagfield: Life_RscEdit
		{
			idc = 2634;
			text = "Dein Gang-Tag";
			x = 0.775;
			y = 0.92;
			w = 0.2125;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class accepttag: Life_RscButtonMenu
		{
			idc = 2635;
			text = "Gang-Tag übernehmen";
			OnButtonClick = "[] spawn life_fnc_gangtag";
			x = 0.45;
			y = 0.92;
			w = 0.3125;
			h = 0.04;
		};
				
		class ButtonCancel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0; closedialog 0;";
			tooltip = "Schließen";
			x = 0.464646;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonReturn: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOhrstoepsel: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonHome: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonInventory: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call life_fnc_numberText]};";
	
	class controlsBackground {
				
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
			
		class Tablet: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\tablet.paa";
			x = -0.4125;
			y = -0.16;
			w = 1.825;
			h = 1.32;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};
		
		class gangtitle: Life_RscText
		{
			idc = -1;
			text = "Gangbook - Deine Gruppierungsplattform";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.035;
			size = 0.035;
			text = "";
			x = 0.25;
			y = 0.36;
			w = 0.5;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "Gruppierung erstellen";
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.3625;
			y = 0.56;
			w = 0.275;
			h = 0.04;
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			x = 0.3125;
			y = 0.44;
			w = 0.375;
			h = 0.04;
		};
		
		class ButtonCancel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0; closedialog 0;";
			tooltip = "Schließen";
			x = 0.464646;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonReturn: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOhrstoepsel: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonHome: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonInventory: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};
