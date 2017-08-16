/*

*/

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "blindfolded")) exitWith {};

if((life_action_inUse) || (player getVariable "tied") || (player getVariable "restrained")) exitWith { 
titleText["You can not do that.","PLAIN"];
titleFadeOut 5;
}; 

if(!([false,"blindfold",1] call life_fnc_handleInv)) exitWith {
["You need to buy a blindfold to do that!",20,"red"] call A3L_Fnc_Msg;
};

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

hint "Blindfolding Target, please wait...";
[[player, "blindfold",125],"life_fnc_playSound",true,false] spawn life_fnc_MP; 
_cme = 1;
_myposy = getPos player;

while {true} do {
life_action_inUse = true;
	if( player distance _myposy > 2.5 ) exitwith { 
			titleText["Target to far away!.","PLAIN"];
	};
	player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if(_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded",true,true];
		[[player], "life_fnc_tieingb", cursorTarget, false] spawn life_fnc_MP;
	};
};
life_action_inUse = false;

