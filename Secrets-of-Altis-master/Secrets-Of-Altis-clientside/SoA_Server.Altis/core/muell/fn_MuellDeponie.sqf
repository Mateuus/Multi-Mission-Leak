/*#######################################
#	Muelldeponie Tonne Verkaufen		#
#	Author: [MdF] Feindflug				#
#######################################*/

private["_PosMuell"];
if(playerSide != civilian) exitWith {hint "Du kannst die Funktion nur als Zivilist nutzen!";};

_unit = player;
_getM = player getVariable "MuellMarkSet";
_PosMuellAthira = (getMarkerPos "muell_1") nearObjects ["Land_GarbageContainer_closed_F", 2];
_PosMuellKavala = (getMarkerPos "muell_2") nearObjects ["Land_GarbageContainer_closed_F", 2];
_mode = _this select 3;

switch (_mode) do {
	case 0: {
		if((count _PosMuellAthira) > 0) then 
		{
			{
				deleteMarkerLocal (_x select 0);
			} forEach _getM;
			
			deletevehicle (_PosMuellAthira select 0);
			
			life_beatgeld = life_beatgeld + muell_verkauf;
			life_exp = life_exp + round(random(750));
			
			if((count muellmarkset) > 0) then
			{
				muellmarkset = muellmarkset - _getM;
			};
			
			_unit setVariable["muellCMAX",0,false];
			_unit setVariable["MuellMarker",0,false];
			_unit setVariable["MuellMarkSet",[],false];

			playsound "muell";
			remoteExecCall ["life_fnc_MuellDeponieSet",0];
			[] spawn life_fnc_exptolevel;
			
			hint format["Du hast die Mülltonne für %1€ verkauft.",[muell_verkauf] call life_fnc_numberText];
			[true,"plastikmuell",round(random 20)] call life_fnc_handleinv;
			
			if(!erfolg_muell) then {erfolg_muell = true; ["erfolg_muell"] spawn life_fnc_erfolgerhalten; sleep 5;};
			
		} else {

			hint "Bitte stelle die Mülltonne in den markierten Bereich.";
		};
	};
	
	case 1: {
		if((count _PosMuellKavala) > 0) then 
		{
			{
				deleteMarkerLocal (_x select 0);
			} forEach _getM;
			
			deletevehicle (_PosMuellKavala select 0);
			
			life_beatgeld = life_beatgeld + muell_verkauf;
			life_exp = life_exp + round(random(750));
			
			if((count muellmarkset) > 0) then
			{
				muellmarkset = muellmarkset - _getM;
			};
			
			_unit setVariable["muellCMAX",0,false];
			_unit setVariable["MuellMarker",0,false];
			_unit setVariable["MuellMarkSet",[],false];

			playsound "muell";
			remoteExecCall ["life_fnc_MuellDeponieSet",0];
			[] spawn life_fnc_exptolevel;
			
			hint format["Du hast die Mülltonne für %1€ verkauft.",[muell_verkauf] call life_fnc_numberText];
			[true,"plastikmuell",round(random 20)] call life_fnc_handleinv;

			if(!erfolg_muell) then {erfolg_muell = true; ["erfolg_muell"] spawn life_fnc_erfolgerhalten; sleep 5;};
			
		} else {

			hint "Bitte stelle die Mülltonne in den markierten Bereich.";
		};
	};
};