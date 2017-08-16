private["_mode"];
disableSerialization;

_mode = _this select 0;

createdialog "atmmenu";
for "_i" from 7911 to 7923 do {ctrlShow [_i,false]};

switch(_mode) do {

	case "einzahlen": {
		ctrlShow [7911,true];
		ctrlShow [7912,true];

		(finddisplay 7910 displayCtrl 7912) ctrlSetStructuredText parseText "Gewählten Betrag einzahlen";
		buttonSetAction [7912, "[] spawn life_fnc_bankDeposit;"];
	};

	case "auszahlen": {
		ctrlShow [7911,true];
		ctrlShow [7912,true];

		(finddisplay 7910 displayCtrl 7912) ctrlSetStructuredText parseText "Gewählten Betrag auszahlen";
		buttonSetAction [7912, "[] spawn life_fnc_bankWithdraw;"];
	};

	case "kontostand": {
		ctrlShow [7913,true];
		ctrlShow [7914,true];

		ctrlSetText [7913,format["%1€",[life_beatbankgeld] call life_fnc_numberText]];
	};

	case "ueberweisen": {
		ctrlShow [7915,true];
		ctrlShow [7916,true];
		ctrlShow [7917,true];

		_units = finddisplay 7910 displayCtrl 7917;
		{
			if(alive _x && (_x != player)) then
			{
				_type = switch (side _x) do
				{
					case west: {"POL"};
					case civilian: {"Zivi"};
					case independent: {"Sani"};
				};
				_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
				_units lbSetData [(lbSize _units)-1,str(_x)];
			};
		} foreach playableUnits;

		lbSort[_units,"DESC"];
		lbSetCurSel [7917,0];
	};

	case "gangkonto": {
		ctrlShow [7918,true];
		ctrlShow [7919,true];
		ctrlShow [7920,true];
		ctrlShow [7921,true];
		ctrlShow [7922,true];
		ctrlShow [7923,true];

		if(isNil {(group player getVariable "gang_bank")}) then {
			ctrlEnable [7918,false];
			ctrlEnable [7919,false];
			ctrlEnable [7920,false];
			ctrlEnable [7921,false];
			ctrlEnable [7922,false];			
			ctrlEnable [7923,false];

			ctrlSetText [7923,"Du bist in keiner Gang."];
		} else {
			_ownerID = group player getVariable["gang_owner",""];
			if(_ownerID == "") then {closeDialog 0;};
			if(_ownerID != getplayerUID player) then {
				ctrlEnable[7920,false];
				ctrlEnable[7921,false];
			};

			_bank = (group player) getVariable ["gang_bank",""];
			_bank = [_bank] call life_fnc_numberText;
			ctrlSetText [7922,format["%1€",_bank]];
		};
	};
};