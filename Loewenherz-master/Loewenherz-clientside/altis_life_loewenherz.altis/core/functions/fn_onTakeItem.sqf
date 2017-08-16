/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
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
	case west: {
		//LHM DonatorWeaponDrop START
		player spawn lhm_fnc_DropDonWeapon;
		//LHM DonatorWeaponDrop END

	}; //Blah
	case civilian: {
		//LHM DonatorWeaponDrop START
		player spawn lhm_fnc_DropDonWeapon;
		//LHM DonatorWeaponDrop END

		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_I_CombatUniform"]) then {
			[_item,false,false,false,false] call lhm_fnc_handleItem;
		};
	};
	case independent: {
		//LHM DonatorWeaponDrop START
		player spawn lhm_fnc_DropDonWeapon;
		//LHM DonatorWeaponDrop END
	};
	case east: {
		//LHM DonatorWeaponDrop START
		player spawn lhm_fnc_DropDonWeapon;
		//LHM DonatorWeaponDrop END

	};
};