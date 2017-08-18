//change the beginning lines after variable definitions to:
if(isNull _group && !(_mode == 5)) exitWith {};

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1 && !(_mode == 5)) exitWith {};


//Then add new case 5

case 5: {
		_gang = [_this,2,"",[""]] call BIS_fnc_param;
		_toAdd = [_this,3,0,[0]] call BIS_fnc_param;
		_query = format["UPDATE gangs SET bank = bank + %1 WHERE name='%2'",_toAdd,_gang];
		_group = grpNull;
		{if(_gang == (_x getVariable["gang_name",""])) exitWith {_group = _x}} forEach allGroups;
		if(!isNull _group) then { _group setVariable["gang_bank",((_group getVariable["gang_bank",0]) + _toAdd),true]; };
	};