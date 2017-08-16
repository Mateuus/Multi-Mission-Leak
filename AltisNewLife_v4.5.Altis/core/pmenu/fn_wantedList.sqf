private["_info","_display","_list","_units","_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;
_units = [];
{
	_units pushBack (_x getVariable["realname",name _x]);
} foreach playableUnits;

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

ctrlSetText[2404,"Connexion etablie"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Pas de criminels";
};