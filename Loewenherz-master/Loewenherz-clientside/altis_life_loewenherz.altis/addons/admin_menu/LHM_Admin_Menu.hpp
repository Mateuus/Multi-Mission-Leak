class LHM_Admin_Menu {
	idd = 6666;
	name= "LHM_Admin_Menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_bankChatDialog;";

	class controlsBackground {
		class MainBackground: lhm_RscText
		{
			idc = 1000;
			x = 0.00479794;
			y = 0.00841761;
			w = 0.991415;
			h = 0.987204;
		};
		class AlleSpielerHeader: lhm_RscText
		{
			idc = 1001;
			text = "Alle Spieler"; //--- ToDo: Localize;
			x = 0.161237;
			y = 0.0317845;
			w = 0.125;
			h = 0.04;
		};
		class AdminMenuMainHeader: lhm_RscText
		{
			idc = 1002;
			text = "Loewenherz Mod Admin Menu"; //--- ToDo: Localize;
			x = 0.00492422;
			y = -0.0393939;
			w = 0.990152;
			h = 0.0343434;
		};
		class AllOptionsHeader: lhm_RscText
		{
			idc = 1003;
			text = "Optionen"; //--- ToDo: Localize;
			x = 0.585858;
			y = 0.03367;
			w = 0.125;
			h = 0.04;
		};
	};

	class controls {
		class AllPlayers: lhm_RscListbox
		{
			idc = 1500;
			x = 0.0302627;
			y = 0.0856876;
			w = 0.370202;
			h = 0.871044;
		};
		class AlleScripte: lhm_RscListbox
		{
			idc = 1501;
			x = 0.462122;
			y = 0.0841751;
			w = 0.368939;
			h = 0.877778;
		};
		class BTNExec: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Execute"; //--- ToDo: Localize;
			x = 0.857576;
			y = 0.0827609;
			w = 0.122601;
			h = 0.0551516;
		};
		class BTNClose: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "CloseDialog 0;";
			x = 0.00126261;
			y = 1.00337;
			w = 0.122601;
			h = 0.0551516;
		};

	};
};