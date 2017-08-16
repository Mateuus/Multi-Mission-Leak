/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/

class Life_craft {
	idd = 666;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class hintergrund: Life_RscText
		{
			idc = 1002;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.516798 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class titel_vehicles: Life_RscText
		{
			idc = 1004;
			text = "Fahrzeuge"; //--- ToDo: ;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
		class crafttitel: Life_RscText
		{
			idc = 1005;
			text = "                                                                Crafting Vehicles"; //--- ToDo: ;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class titel_Materialien: Life_RscText
		{
			idc = 1006;
			text = "Materialien"; //--- ToDo: ;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
	};

	class controls {
		class vehicleanzeige: Life_RscListbox
		{
			onLBSelChanged = "[] spawn life_fnc_craft_update";
			idc = 669;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class auswahl: Life_RscCombo
		{
			onLBSelChanged  = "_this call life_fnc_craftFilter";
			idc = 673;
			x = 0.614583 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class materialanzeige : Life_RscStructuredText
		{
			idc = 672;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};

		class craftbutton: Life_RscButtonMenu
		{
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftAction};";
			idc = 672;
			text = "Bauen"; //--- ToDo: ;
			x = 0.626042 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	};
};


class Life_craft_Item {
	idd = 766;
	name= "Life_craft_Item";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_craftitem";

	class controlsBackground {
		
		class hintergrund: Life_RscText
		{
			idc = 1002;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.516798 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class titel_vehicles: Life_RscText
		{
			idc = 1004;
			text = "Items"; //--- ToDo: ;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
		class crafttitel: Life_RscText
		{
			idc = 1005;
			text = "                                                                Crafting Items"; //--- ToDo: ;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class titel_Materialien: Life_RscText
		{
			idc = 1006;
			text = "Materialien"; //--- ToDo: ;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
	};

	class controls {
		class vehicleanzeige: Life_RscListbox
		{
			onLBSelChanged = "[] spawn life_fnc_craft_updateitem";
			idc = 769;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class auswahl: Life_RscCombo
		{
			onLBSelChanged  = "[] call life_fnc_craft_updateFilteritem";
			idc = 773;
			x = 0.614583 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class materialanzeige : Life_RscStructuredText
		{
			idc = 772;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};

		class craftbutton: Life_RscButtonMenu
		{
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftActionitem};";
			idc = 772;
			text = "Bauen"; //--- ToDo: ;
			x = 0.626042 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	};
};



class Life_craft_weapons {
	idd = 866;
	name= "life_craft_weapons";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class hintergrund: Life_RscText
		{
			idc = 1002;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.516798 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class titel_vehicles: Life_RscText
		{
			idc = 1004;
			text = "Waffen"; //--- ToDo: ;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
		class crafttitel: Life_RscText
		{
			idc = 1005;
			text = "                                                                Crafting Waffen"; //--- ToDo: ;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.464063 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class titel_Materialien: Life_RscText
		{
			idc = 1006;
			text = "Materialien"; //--- ToDo: ;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0439828 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.05;
		};
	};

	class controls {
		class vehicleanzeige: Life_RscListbox
		{
			onLBSelChanged = "[] spawn life_fnc_craftupdateweapon";
			idc = 869;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class auswahl: Life_RscCombo
		{
			onLBSelChanged  = "_this call life_fnc_craftFilterweapon";
			idc = 873;
			x = 0.614583 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class materialanzeige : Life_RscStructuredText
		{
			idc = 872;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};

		class craftbutton: Life_RscButtonMenu
		{
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftActionweapon};";
			idc = 872;
			text = "Bauen"; //--- ToDo: ;
			x = 0.626042 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	};
};

class Life_ColorList 
{
	idd = 45900;
	name="life_ColorList";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_craftVehicleSpawnMenu";

	class controlsBackground 
	{
		class hintergrund: RscText
		{
			idc = 1002;
			x = 0.339583 * safezoneW + safezoneX;
			y = 0.236102 * safezoneH + safezoneY;
			w = 0.320833 * safezoneW;
			h = 0.428833 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class crafttitel: RscText
		{
			idc = 1005;
			text = "                                               Crafting Vehicles Farbauswahl"; //--- ToDo: ;
			x = 0.339584 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.320833 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls 
	{
		class rsccombo: RscCombo
		{
			idc = 45904;
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class textsanzeige: RscStructuredText
		{
			idc = -1;
			text = "Waehle bitte die Fahrzeugfarbe aus die dein Fahrzeug nach der Herstellung haben soll"; //--- ToDo: ;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.351863 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class Bestatigenbutton: RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[true] spawn life_fnc_VehicleSpawn;";
			text = "Bestatigen"; //--- ToDo: ;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class closebutton: RscButtonMenu
		{
			idc = 2401;
			text = "Schliessen"; //--- ToDo: ;
			onButtonClick = "closeDialog 0;";
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.598961 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	
	};
};