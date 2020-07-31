/*
	File: fn_onTakeItem.sqf
	
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = param [0,ObjNull,[ObjNull]];
_container = param [1,ObjNull,[ObjNull]];
_item = param [2,"",[""]];

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

switch(playerSide) do
{
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_I_CombatUniform"] || _container isKindOf "Man") then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
};