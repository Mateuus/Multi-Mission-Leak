class DWEV_taximeter {
	idd = 13000;
	name= "DWEV_taximeter";
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	//onLoad="uiNamespace setVariable ['DWEV_taximeter',_this select 0]; [(vehicle player)] spawn MSR_fnc_taxiMeter;";
	onLoad="uiNamespace setVariable ['DWEV_taximeter',_this select 0]; [(vehicle player)] spawn DWEV_fnc_taxiMeter;";
	objects[]={};
	
		
	class controlsBackground {
		
		class MainBackground:DWEV_RscText {
			colorBackground[] = {(160 / 255), (82 / 255), (45 / 255), 1};
			idc = -1;
			x = 0.1;
			y = safeZoneY + 0.02 ;
			w = 0.8;
			h = 0.1 ;
		};
		
		class ModeBackground:DWEV_RscText {
			colorBackground[] = {0, 0, 0, 1};
			idc = -1;
			x = 0.11;
			y = safeZoneY + 0.03 ;
			w = 0.1;
			h = 0.08 ;
		};

		class PrizeBackground:DWEV_RscText {
			colorBackground[] = {0, 0, 0, 1};
			idc = -1;
			x = 0.22;
			y = safeZoneY + 0.03;
			w = 0.33;
			h = 0.08 ;
		};
		
		class SpeedBackground:DWEV_RscText {
			colorBackground[] = {0, 0, 0, 1};
			idc = -1;
			x = 0.56;
			y = safeZoneY + 0.03;
			w = 0.16;
			h = 0.08 ;
		};
		
		class DistBackground:DWEV_RscText {
			colorBackground[] = {0, 0, 0, 1};
			idc = -1;
			x = 0.73;
			y = safeZoneY + 0.03;
			w = 0.16;
			h = 0.08 ;
		};
		
		class Mode : DWEV_RscStructuredText
		{
			idc = 13001;
			text = "ERR<br/>ERR";
			x = 0.11;
			y = safeZoneY + 0.03;
			w = 0.1;
			h = 0.08 ;
		};

		class Prize : DWEV_RscStructuredText
		{
			idc = 13002;
			text = "ERR<br/>ERR";
			x = 0.22;
			y = safeZoneY + 0.03;
			w = 0.33;
			h = 0.08 ;
		};
		
		class Speed : DWEV_RscStructuredText {
		
			idc = 13004;
			text = "ERR<br/>ERR";
			x = 0.56;
			y = safeZoneY + 0.03;
			w = 0.16;
			h = 0.08 ;
		};
		
		class Dist : DWEV_RscStructuredText
		{
			idc = 13003;
			text = "ERR<br/>ERR";
			x = 0.73;
			y = safeZoneY + 0.03;
			w = 0.16;
			h = 0.08 ;
		};
		
		
		
	};
	
	
};
