/*
	File: fn_cop_classification_organize.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/




private ["_wasTUN","_textlein","_text","_ui","_strTEXT"];

_wasTUN = param[0,0,[0]];
_textlein = param[1,[],[[]]];
disableSerialization;

switch(_wasTUN) do {
	case 1: {
			closeDialog 0;
			5 cutRsc ["lhm_radar","PLAIN"];

	};
	case 2: {
			_text = composeText _textlein;
			_ui = uiNameSpace getVariable "lhm_radar";
			_strTEXT = _ui displayCtrl 1110;
			_strTEXT ctrlSetStructuredText _text;

	};
	case 3: {
			5 cutText ["","PLAIN"];

	};
	case 4: {
		_display = findDisplay 5488;
		_lBOX = _display displayCtrl 1500;
		_map = _display displayctrl 38502;
		_btn_radar_small = _display displayctrl 2402;


		if(LHM_Small_Radar_on) then {
			_btn_radar_small ctrlsettext "Radar Small OFF";
		} else {
			_btn_radar_small ctrlsettext "Radar Small ON";


		};

	};
};



