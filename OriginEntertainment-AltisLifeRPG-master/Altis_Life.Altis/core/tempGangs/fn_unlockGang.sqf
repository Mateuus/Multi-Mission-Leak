/*	
		File: fn_unlockGang.sqf
*/
private["_gang","_index","_name","_group","_owner","_ownerID"];
_index = [life_my_group,life_group_list] call TON_fnc_index;
if(_index == -1) exitWith {};
_gang = life_group_list select _index;
_name = _gang select 0;
_group = _gang select 1;
_owner = _gang select 3;
_ownerID = _gang select 4;

switch (true) do
{	
	case (player == leader(group player)) :	
	{		
		life_group_list set[_index,[_name,_group,false,_owner,_ownerID]];		
		publicVariable "life_group_list";		
		
		ctrlShow[2622,true];		
		ctrlShow[2623,false];	
	};		
	
	case (getPlayerUID player == _ownerID) :	
	{		
		life_group_list set [_index,[_name,_group,false,_owner,_ownerID]];		
		publicVariable "life_group_list";		
		
		ctrlShow[2622,true];		
		ctrlShow[2623,false];	
	};
};

[false] spawn life_fnc_gangManagement;