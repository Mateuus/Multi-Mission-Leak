_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};if(!(_unit isKindOf "Man") || !isPlayer _unit) exitWith {};
if(player distance _unit > 5) exitWith {};
player setVariable["isDragging",true,true];
player setVariable["dragging",_unit,true];
hint format["%1 you are now dragging %2",name player,name _unit];
life_actInUse_global = true;_unit attachTo [player, [0, 1.1, 0.092]];
_unit setDir 180;

if(currentWeapon player != "") then {player playMoveNow "AcinPknlMstpSrasWrflDnon";
} else {
	player playMoveNow "AcinPknlMstpSnonWnonDnon";
	};
	 _dragact = player addAction ["<t color=""#C90000"">" + "Set Player Down" + "</t>", { 	player setVariable["isDragging",false,true]; life_actInUse_global = false;	
		_unit = player getVariable "dragging";	
		_unit switchMove "AinjPpneMstpSnonWrflDnon"; 	
		player playMoveNow "AmovPercMstpSnonWnonDnon";
		  	detach _unit;
		 	_act = _this select 2;
			player removeAction _act;
				},"",10,true];

				while {(player getVariable "isDragging")} do {	
		if(!(player getVariable "isDragging")) then {player removeAction _id;
	};
};