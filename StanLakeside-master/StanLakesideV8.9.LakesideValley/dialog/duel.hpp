class Life_KBW_Duel
{
	idd = 15100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {dialog}; ctrlShow[101,false]};";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Nearby Players";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListBox
		{
			idc = 15101;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 101;
			text = "Challenge!";
			onButtonClick = "life_racing = true; [] spawn KBW_fnc_duelRequest;";
			x = 0.530358 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.200365 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 100;
			text = "Add Racer";
			onButtonClick = "if(lbCurSel 15101 == -1) exitWith {[localize 'STR_Global_NoSelection'}, false] spawn domsg; _unit = lbData[15101,(lbCurSel 15101)]; _unit = call compile format['%1',_unit]; if(_unit in life_racers || vehicle _unit == _unit) exitWith {}; life_racers pushBack _unit; ctrlShow[101,true]; _out = ''; {_toAdd = name _x + ' '; _out = _out + _toAdd} forEach life_racers; [format['Current Racers: %1',_out], false] spawn domsg;";
			x = 0.399211 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.128719 * safezoneW;
			h = 0.0220037 * safezoneH;
		};

		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.127505 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};