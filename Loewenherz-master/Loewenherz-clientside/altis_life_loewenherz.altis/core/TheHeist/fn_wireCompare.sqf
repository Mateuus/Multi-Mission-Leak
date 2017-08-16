//Parameters
private ["_wire","_cutWire", "_compare"];
//_wire    = param [0,"",[""]];
_cutWire = param [1,"",[""]];

//compare wires
_wire = fed_bank getvariable["wire",""];
_compare = [_wire, _cutWire] call BIS_fnc_areEqual;

switch (playerSide) do
{
	case west:
	{
		if (_compare) then {
			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Bombe entschaerft!</t><br/>"];
			fed_bank setVariable["chargeplaced",false,true]; // disable and remove bomb
			playSound "button_close";
		} else {
			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Falscher Draht!</t><br/>"];
			fed_bank setVariable["chargecodewrong",true,true];
			playSound "button_wrong";
		};
	};

	case civilian:
	{
		hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Draht kann nicht durchtrennt werden!</t><br/>"];
	};
};




//Return Value
_wire
