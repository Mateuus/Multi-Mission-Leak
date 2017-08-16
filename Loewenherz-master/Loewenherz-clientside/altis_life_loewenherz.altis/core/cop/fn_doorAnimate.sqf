private["_b","_door"];
_b = _this select 0;

_door = [_b] call lhm_fnc_nearestDoor;

if(_door == 0) exitWith {hint "no door here?"};

if(typeof _b in ["Land_Dome_Big_F","Land_Dome_Small_F"]) then {
	if(typeof _b == "Land_Dome_Small_F") then {

			if(_door == 1) then {

				if((_b animationPhase "door_1B_move" == 0) && (_b animationPhase "door_1A_move" == 0)) then {
					_b animateSource["door_1B_move",1];
					_b animateSource["door_1A_move",1];
				} else {
					_b animateSource["door_1B_move",0];
					_b animateSource["door_1A_move",0];
				};
			 } else {

			 	if((_b animationPhase "door_2B_move" == 0) && (_b animationPhase "door_2A_move" == 0)) then {
					_b animateSource["door_2B_move",1];
					_b animateSource["door_2A_move",1];
				} else {
					_b animateSource["door_2B_move",0];
					_b animateSource["door_2A_move",0];
				};


			 };

	} else {
			if(_door == 1) then {

				if((_b animationPhase "door_1B_move" == 0) && (_b animationPhase "door_1A_move" == 0)) then {
					_b animateSource["door_1B_move",1];
					_b animateSource["door_1A_move",1];
				} else {
					_b animateSource["door_1B_move",0];
					_b animateSource["door_1A_move",0];
				};
			 } else {

			 	if(_b animationPhase format["Door_%1_source",_door] == 0) then {
					_b animateSource[format["Door_%1_source",_door],1];
				} else {
					_b animateSource[format["Door_%1_source",_door],0];
				};
			};
};


} else {


	if(_b animationPhase format["Door_%1_source",_door] == 0) then {
		_b animateSource[format["Door_%1_source",_door],1];
	} else {
		_b animateSource[format["Door_%1_source",_door],0];
	};
};
closeDialog 0;