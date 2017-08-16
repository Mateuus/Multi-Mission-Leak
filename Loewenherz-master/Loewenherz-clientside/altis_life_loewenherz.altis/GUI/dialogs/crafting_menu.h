class crafting
{
	idd = 1584;
	name="crafting";
	movingEnabled = 0;
	enableSimulation = 1;
	
	
	class controlsBackground
	{
		class TabletBackground: lhm_RscPicture
		{
			idc = 1200;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
		};
		
			
		class Crafting_auswahl_header: lhm_RscText
		{
			idc = 1000;
			text = "Crafting Rezepte"; //--- ToDo: Localize;
			x = 0.128915;
			y = 0.25872;
			w = 0.36553;
			h = 0.04;
		};
		class Crafting_Kategorie_header: lhm_RscText
		{		
			idc = 1001;
			text = "Crafting Kategorie"; //--- ToDo: Localize;
			x = 0.540404;
			y = 0.254209;
			w = 0.316288;
			h = 0.0416835;
		};
		class What_u_need: lhm_RscText
		{
			idc = 1002;
			text = "Zum Craften benoetigtes"; //--- ToDo: Localize;
			x = 0.540405;
			y = 0.367004;
			w = 0.317551;
			h = 0.0383166;
		};
		class Crafting_menu_header: lhm_RscText
		{
			idc = 1003;
			text = "Crafting Menu - Loewenherz"; //--- ToDo: Localize;
			x = 0.371212;
			y = 0.200337;
			w = 0.3;
			h = 0.04;
		};
		class Close_Picture: lhm_RscPicture
		{
			idc = 1201;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.872854;
			y = 0.731515;
			w = 0.1;
			h = 0.1;
		};
		
		
	};
	
	class controls
	{
	
		class Close_BTN: lhm_RscButtonSilent
		{
			idc = 1600;
			tooltip = "$STR_Global_Close";
			onButtonClick = "[] spawn {closeDialog 0; waituntil{!dialog;};[] call lhm_fnc_p_openMenu;};";
			x = 0.875;
			y = 0.730842;
			w = 0.1;
			h = 0.1;
		};

		class Crafting_list: lhm_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "[] call lhm_fnc_lb_sel_changed";
			sizeEx = 0.040;
			x = 0.128788;
			y = 0.320404;
			w = 0.363763;
			h = 0.496633;
		};
		class Benoetigtes_zum_craften: lhm_RscListbox
		{
			idc = 1501;
			sizeEx = 0.0360;
			x = 0.53952;
			y = 0.41643;
			w = 0.319823;
			h = 0.396229;
		};
		class Wat_will_der_craften_Kategorie: lhm_RscCombo
		{
			idc = 2100;
			onLBSelChanged = "[] call lhm_fnc_menu_combo_switched;";
			x = 0.538636;
			y = 0.31724;
			w = 0.317677;
			h = 0.04;
		};
		class Craft_action_BTN: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Craft!"; //--- ToDo: Localize;
			x = 0.868181;
			y = 0.313469;
			w = 0.0934343;
			h = 0.046734;
		};
		
	};
};