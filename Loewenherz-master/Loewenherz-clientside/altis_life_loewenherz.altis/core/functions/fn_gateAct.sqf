private["_gate","_action","_plist"];

if(isServer) exitWith{};

_gate = param [0,ObjNull,[ObjNull]];
_action = param [1,"",[""]];
_plist = param [2,[],[[]]];

switch (_action) do
{
	case "enter": {
		if(count _plist > 0) then { _gate animateSource ["Door_1_source",1]; };
	};
	case "exit": {
		if( {_x in _plist} count (playableUnits + switchableUnits) < 1) then { _gate animateSource ["Door_1_source", 0]; };
	};
};