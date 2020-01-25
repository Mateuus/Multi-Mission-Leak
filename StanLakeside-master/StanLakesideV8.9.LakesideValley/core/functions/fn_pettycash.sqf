// petty cash piles
_pettycash = _this select 0;
if ( cgbankvault animationPhase "d_o_Anim" != 1 ) exitWith {
	["The vault door is closed, you cant grab cash right now...",30,"red"] spawn domsg;
};

if (_pettycash getVariable ["robbed", false]) exitwith {["This stash of cash was recently robbed.",30,"red"] spawn domsg;};
_pettycash setVariable ["robbed", true, true];
_funds = 500 + round(random 3500); 

[_pettycash,true] remoteExecCall ["TON_fnc_hideThis",2];
[format ["You picked up %1 in petty cash..",_funds], false] spawn domsg;
["cash","add",_funds] call life_fnc_handleCash;