class gang_recruiting {
	idd = 2800;
	name= "gang_recruiting";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_m_GangRecruiting_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class gangList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_cdgrmmorexrwvqdklasfoycmufvlynrcjbpygelaocaqjnnkrfwioq";
			
			x = 0.12; y = 0.26;
			w = 0.2; h = 0.4;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.34;
			y = 0.03;
			w = 0.6;
			h = 0.6;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ApplyButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_m_GangApply";
			onButtonClick = "[] call life_fnc_lbdjgdbpbfpqpnsisscleyesszkrevbmbcechwodjlicuvqxag; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class HandleButtonKey : Life_RscButtonMenu {
			idc = 2407;
			text = "STR_m_GangHandle";
			onButtonClick = "[1] call life_fnc_yiaxzqciizubxgnbjkabrrdvrcvnpjwhvlzvwapyfxhzjjzwospkcivdlzb;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class RemoveGangButtonKey : Life_RscButtonMenu {
			idc = 2408;
			text = "STR_m_GangRemove";
			tooltip = "Moderator/Admin-knapp för att ta bort ett opassande gäng från rekrytering";
			onButtonClick = "[] call life_fnc_ilrzbicsdmnoyzearegghycadcqrewitlrlowuipdgspkyljeneth;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		
	};
};