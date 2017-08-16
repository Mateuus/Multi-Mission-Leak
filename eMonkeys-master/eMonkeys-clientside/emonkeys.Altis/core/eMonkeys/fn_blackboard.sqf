/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Leased the Fuelstation (Originalscript buyHouse.sqf by Bryan "Tonic" Boardwine)
*/
private["_display","_newsformat","_listbox ","_text","_time","_news","_date"];
disableSerialization;
_mode = _this select 0;
_text = _this select 1;

switch (_mode) do
{
	case 0:
	{
		createDialog "blackboard";
		_display = findDisplay 9000;
		_listbox = _display displayCtrl 9004;
		_newsformat = "";
		
		{
			
			_news = _x select 0;
			_time = _x select 1;
			_newsformat = format ["<t align='left' size='0.8' color='#494949' >News vom : %1<br/><t align='left' size='1.0' color='#000000' >%2</t></t><br/><br/>",_time,_news] + _newsformat;
		} forEach _text;
	
		_listbox ctrlSetStructuredText parseText format["%1",_newsformat];
		
		if((call EMonkeys_adminlevel) < 1) then {ctrlShow[9005,false];};
	};
	case 1:
	{
		if((call EMonkeys_adminlevel) < 1) exitWith {};
		createDialog "blackboard_menu";
		_display = findDisplay 9000;
	};
	case 2:
	{
		_message = ctrlText 9004;
		[[_message],"TON_fnc_setNews",false,false] spawn EMonkeys_fnc_MP;

		closeDialog 0;
	};
};