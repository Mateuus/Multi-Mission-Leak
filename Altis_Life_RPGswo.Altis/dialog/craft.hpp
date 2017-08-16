/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
	Edit: Devision-Wolf Sandmann
*/
class DWEV_craft {
	idd = 666;
	name= "DWEV_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_craft";

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
		class Shopname_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Waffenfabrik";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};

		class craftListHeader : DWEV_RscText
		{
			idc = 668;
			text = "Herstellbares";
			sizeEx = 0.04;
			x = 0.105;
			y = 0.26;
			w = 0.275;
			h = 0.04;
		};

		//Craft list
		class craftList : DWEV_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn DWEV_fnc_craft_update";
			colorBackground[] = {0, 0, 0, 0};
			x = 0.105;
			y = 0.31;
			w = 0.275;
			h = 0.44;
		};

		//Materials list header
		class materialListHeader : DWEV_RscText
		{
			idc = 670;
			colorBackground[] = {0, 0, 0, 0};
			text = "Benötigte Materialien";
			sizeEx = 0.04;
			x = 0.395;
			y = 0.26;
			w = 0.275;
			h = 0.04;
		};

		//Materials list
		class materialList : DWEV_RscControlsGroup
		{
			idc = 671;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;

			class Controls
			{
				class mats : DWEV_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27;
					h = 0.44;
				};
			};
		};

		//FILTER
		class FilterList : DWEV_RscCombo
		{
			idc = 673;
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged  = "[] call DWEV_fnc_craft_updateFilter";
			x = 0.69;
			y = 0.26;
			w = 0.21;
			h = 0.04;
		};

		class ctrl_grafik_herstellen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_craft.paa";
			x = 0.7575;
			y = 0.4625;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_herstellen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Gegenstand Herstellen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "if(!DWEV_is_processing) then {[] spawn DWEV_fnc_craftAction};";
			x = 0.7575;
			y = 0.4625;
			w = 0.075;
			h = 0.075;
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
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
}; 