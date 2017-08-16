/*
fn_unlearnBH.sqf
Kevin Webb
allows our bounty hunter to re-spec in the skiptracer system.
*/
[] spawn {
	_action = ["Unlearning an honor specialty will cost $5,000 - are you sure?","Unlearn and refund honor","Yes","No"] call BIS_fnc_GUIMessage;
	if(!_action) exitWith {};
	disableSerialization;
	_id = call compile lbData[1702,lbCurSel 1702];
	_cost = 0;
	_child = 0;
	{
		if(_id == _x select 3) then {_child = _x select 0};
		if(_id == _x select 0) then {_cost = _x select 1};
	} forEach life_skiptracerInfo;
	if(_child in life_honortalents) exitWith {hint "This specialty has a child talent which must be unlearned first"};
	if(!([5000] call life_fnc_debitCard)) exitWith {};
	life_honor = life_honor + _cost;
	life_honortalents = life_honortalents - [_id];
	[] spawn life_fnc_prestigeMenu;
};