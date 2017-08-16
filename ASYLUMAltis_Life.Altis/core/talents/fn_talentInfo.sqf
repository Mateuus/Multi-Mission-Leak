/*
	File: fn_talentInfo.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays details about the selected talent.
	Please either get Asylum permission to use this or create this system yourself.
*/
private["_display","_text","_index","_talent","_label","_req","_learn"];
disableSerialization;
_display = findDisplay 3700;
_text = _display displayCtrl 3703;
_learn = _display displayCtrl 3710;
_index = lbData[3702,lbCurSel (3702)];
_index = call compile format["%1", _index];

if(isNil "_index") exitWith {_text ctrlSetText "Invalid talent data.";};

_talent = [];
{
	if ((_x select 0) == _index) exitWith{ _talent = _x; };
} foreach life_talentInfo;

if(count _talent < 1) exitWith {_text ctrlSetText "Talent data not found.";};

_label = format["<t font='puristaMedium' shadow='1' size='2'>%1</t><br/>", _talent select 2];

_req = [];
if ((_talent select 3) > 1) then
{
	{
		if ((_x select 0) == (_talent select 3)) exitWith{ _req = _x; };
	} foreach life_talentInfo;
	_label = format["%1<t shadow='1'>Requires %2.</t><br/><br/>", _label, _req select 2];
}
else { _label = format["%1<t shadow='1'>No requirements.</t><br/><br/>", _label]; };

if ((_talent select 0) in life_talents) then { _label = format["%1<t color='#00FF00'>You have learned this talent.</t><br/><br/>", _label]; }
else
{
	if (count _req > 0) then
	{
		if (!((_req select 3) in life_talents)) then { _label = format["%1<t color='#FF0000'>You must learn %2 before you can learn this.</t><br/><br/>", _label, _req select 2]; }
		else { _label = format["%1You have not yet learned this talent, but you do meet its requirements.<br/><br/>", _label]; };
	}
	else
	{
		_label = format["%1You have not yet learned this talent.<br/><br/>", _label];
	};
};

_label = format["%1%2", _label, _talent select 4];
_text ctrlSetStructuredText parseText _label;

_max = [] call life_fnc_calTalents;
_free = _max - (count life_talents);

_learn ctrlShow true;
if (!((_talent select 0) in life_talents)) then { _learn ctrlSetText "Learn" }
else { _learn ctrlSetText "Unlearn" };

_learn ctrlEnable (((_free > 0) && ((_talent select 3) == 0 || (_talent select 3) in life_talents)) || (_talent select 0) in life_talents);