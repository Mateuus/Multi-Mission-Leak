class DWEV_My_Gang_Diag {
	idd = 2620;
	name= "DWEV_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";

	class controlsBackground
	{
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
	};

	class controls {
		class Title_GangName : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2629;
			text = "";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class GangBank : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 601;
			style = 0x02;
			text = "";
			x = 0;
			y = 0.2;
			w = 1;
			h = 0.04;
		};

		class GangMemberList : DWEV_RscListBox
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			x = 0.05;
			y = 0.26;
			w = 0.550;
			h = 0.370;
		};

		// invite Spielerliste-
		class GangInvitePlayerList : DWEV_RscCombo
		{
			idc = 2632;
			x = 0.62;
			y = 0.68;
			w = 0.225;
			h = 0.03;
		};

		class ctrl_grafik_GangLeave: DWEV_RscPicture
		{
			idc = 507013;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_leave.paa";
			x = 0.70;
			y = 0.26;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_GangLeave: DWEV_RscButtonInvisible
		{
			idc = 507014;
			text = "";
			tooltip = "Gang verlassen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_gangLeave";
			x = 0.70;
			y = 0.26;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_Gangupgrade: DWEV_RscPicture
		{
			idc = 507015;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_upgrade.paa";
			x = 0.70;
			y = 0.325;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_Gangupgrade: DWEV_RscButtonInvisible
		{
			idc = 507016;
			text = "";
			tooltip = "Gangplätze erweitern";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gangUpgrade";
			x = 0.70;
			y = 0.325;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_Gangkick: DWEV_RscPicture
		{
			idc = 507017;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.70;
			y = 0.395;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_Gangkick: DWEV_RscButtonInvisible
		{
			idc = 507018;
			text = "";
			tooltip = "Mitglied rauswerfen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_gangKick";
			x = 0.70;
			y = 0.395;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_GangLeader: DWEV_RscPicture
		{
			idc = 507019;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_leader.paa";
			x = 0.70;
			y = 0.465;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_GangLeader: DWEV_RscButtonInvisible
		{
			idc = 507020;
			text = "";
			tooltip = "Gang Leader abgeben";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gangNewLeader";
			x = 0.70;
			y = 0.465;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_Gangaufloesen: DWEV_RscPicture
		{
			idc = 507021;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_aufloesen.paa";
			x = 0.70;
			y = 0.535;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_Gangaufloesen: DWEV_RscButtonInvisible
		{
			idc = 507022;
			text = "";
			tooltip = "Gang auflösen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gangDisband";
			x = 0.70;
			y = 0.535;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_GangInvite: DWEV_RscPicture
		{
			idc = 507023;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_hinzufuegen.paa";
			x = 0.70;
			y = 0.605;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_GangInvite: DWEV_RscButtonInvisible
		{
			idc = 507024;
			text = "";
			tooltip = "Spieler einladen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gangInvitePlayer";
			x = 0.70;
			y = 0.605;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Gang übersicht schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call DWEV_fnc_p_updateMenu";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_grafik_Befoerderung: DWEV_RscPicture
		{
			idc = -1;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_upgrade.paa";
			x = 0.77;
			y = 0.26;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_Befoerderung: DWEV_RscButtonInvisible
		{
			idc = -1;
			text = "";
			tooltip = "Spieler befördern";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[true] call DWEV_fnc_gangSetPlayerRank";
			x = 0.77;
			y = 0.26;
			w = 0.06;
			h = 0.06;
		};
		
		class ctrl_grafik_Degradierung: DWEV_RscPicture
		{
			idc = -1;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_aufloesen.paa";
			x = 0.77;
			y = 0.325;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_Degradierung: DWEV_RscButtonInvisible
		{
			idc = -1;
			text = "";
			tooltip = "Spieler degradieren";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[false] call DWEV_fnc_gangSetPlayerRank";
			x = 0.77;
			y = 0.325;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_grafik_editgantag: DWEV_RscPicture
		{
			idc = -1;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_tag.paa";
			x = 0.77;
			y = 0.39;
			w = 0.06;
			h = 0.06;
		};

		class ctrl_button_editgang: DWEV_RscButtonInvisible
		{
			idc = -1;
			text = "";
			tooltip = "Gangtag ändern";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[""Gib den neuen Clantag ein!"", ""DWEV_fnc_updateGangTag"", ((group player) getVariable [""gang_tag"",""ERROR1""])] call DWEV_fnc_howMuch;";
			x = 0.77;
			y = 0.39;
			w = 0.06;
			h = 0.06;
		};
	};
};

class DWEV_Create_Gang_Diag {
	idd = 2520;
	name= "DWEV_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[""Es kostet %1€ eine neue Gang zu gründen"",[(call DWEV_gangPrice)] call DWEV_fnc_numberText]};";

	class controlsBackground {

		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
	};

	class controls {

		class InfoMsg : DWEV_RscStructuredText
		{
			idc = 2523;
			colorBackground[] = {0, 0, 0, 0};
			sizeEx = 0.020;
			text = "";
			x = 0.276;
			y = 0.25;
			w = 0.5;
			h = 0.11;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Gang gründen";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class ctrl_grafik_Ganggruenden: DWEV_RscPicture
		{
			idc = 507009;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.650;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_Ganggruenden: DWEV_RscButtonInvisible
		{
			idc = 507010;
			text = "";
			tooltip = "Gang Gründen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_createGang";
			x = 0.650;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_grafik_Gangschliessen: DWEV_RscPicture
		{
			idc = 507011;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.270;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_Gangschliessen: DWEV_RscButtonInvisible
		{
			idc = 507012;
			text = "";
			tooltip = "Gang nicht gründen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; [] call DWEV_fnc_p_updateMenu;";
			x = 0.270;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};

		class CreateGangText : DWEV_RscEdit
		{
			idc = 2522;
			text = "Name der Gang";
			x = 0.3375;
			y = 0.35;
			w = 0.325;
			h = 0.04;
		};

		class CreateGangtagText : DWEV_RscEdit
		{
			idc = 2524;
			text = "Gangtag";
			x = 0.3375;
			y = 0.4;
			w = 0.325;
			h = 0.04;
		};

		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Gang Erstellung schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; [] call DWEV_fnc_p_updateMenu;";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};
