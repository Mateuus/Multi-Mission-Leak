class BA_dialog_interaction_menu {
	idd = 8540;
	name= "BA_dialog_interaction_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn lhm_fnc_interactionChat;";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls {

		class BLAH: lhm_RscStructuredText
		{
			idc = 1500;
			text = "";
			sizeEx = 0.01;
			x = 0.228409;
			y = 0.158115;
			w = 0.673863;
			h = 0.516027;
		};
		
		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
		
		class Antowrten: lhm_RscListbox
		{
			idc = 9999;
			sizeEx = 0.04;
			x = 0.229798;
			y = 0.680135;
			w = 0.670707;
			h = 0.157239;
		};
		
		class OKantwort: lhm_RscButtonMenu
		{
			idc = 9998;
			onButtonClick = "disableSerialization; _display = findDisplay 8540; _listbox = _display displayCtrl 9999; if(Lbcursel _listbox != -1 ) then {LHM_Click = true;} else {hint ""Du musst eine Antwort auswählen""};";
			text = "OK";
			x = 0.901894;
			y = 0.68101;
			w = 0.0746214;
			h = 0.153872;
		};
		
		

		class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		
	};
};