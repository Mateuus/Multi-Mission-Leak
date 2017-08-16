/*
	File: fn_prestigeInfo.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays details about the selected speciality.
	Please either get Asylum permission to use this or create this system yourself.
*/
private["_display","_text","_index","_talent","_label","_req","_learn"];
disableSerialization;
_display = findDisplay 1700;
_text = _display displayCtrl 1703;
_learn = _display displayCtrl 1710;
_index = lbData[1702,lbCurSel (1702)];
_index = call compile format["%1", _index];
_vars = if(playerSide == civilian) then {[life_skiptracerInfo,life_honortalents,"Honor"]} else {[life_prestigeInfo,life_coptalents,"Prestige"]};
if(isNil "_index") exitWith {_text ctrlSetText "Invalid prestige data.";};

_talent = [];
{
	if ((_x select 0) == _index) exitWith{ _talent = _x; };
} foreach (_vars select 0);

if(count _talent < 1) exitWith {_text ctrlSetText "Prestige data not found.";};

_label = format["<t font='puristaMedium' shadow='1' size='2'>%1</t><br/>%2 %3. ", _talent select 2, [_talent select 1] call life_fnc_numberText, _vars select 2];

_req = [];
if ((_talent select 3) > 0) then
{
	{
		if ((_x select 0) == (_talent select 3)) exitWith{ _req = _x; };
	} foreach (_vars select 0);
	_label = format["%1<t shadow='1'>Requires %2.</t><br/><br/>", _label, _req select 2];
}
else { _label = format["%1<t shadow='1'>No requirements.</t><br/><br/>", _label]; };

if ((_talent select 0) in (_vars select 1)) then { _label = format["%1<t color='#00FF00'>You have learned this talent.</t><br/><br/>", _label]; }
else
{
	if (count _req > 0) then
	{
		if (!((_talent select 3) in (_vars select 1))) then { _label = format["%1<t color='#FF0000'>You must learn %2 before you can learn this.</t><br/><br/>", _label, _req select 2]; }
		else { _label = format["%1You have not yet learned this talent, but you do meet its requirements.<br/><br/>", _label]; };
	}
	else
	{
		_label = format["%1You have not yet learned this talent.<br/><br/>", _label];
	};
};

if ((_talent select 3) == 0) then { _label = format["%1<t size='0.6'>", _label]; };
_label = format["%1%2", _label, _talent select 4];
_text ctrlSetStructuredText parseText _label;

_learn ctrlShow true;
_learn ctrlEnable (((_talent select 3) == 0 || (_talent select 3) in (_vars select 1)) &&  !((_talent select 0) in (_vars select 1)));

_unlearn = _display displayCtrl 1711;
_unlearn ctrlEnable ((_talent select 0) in (_vars select 1));