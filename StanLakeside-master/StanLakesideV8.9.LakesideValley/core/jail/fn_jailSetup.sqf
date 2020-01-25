/*
	fn_jailSetup.sqf
*/

_minutes = parseNumber life_arrestMinutes;
life_bail_amount = _minutes * 425;

_hours = floor (_minutes/60);
_minutes = _minutes % 60;

player setVariable ["restrained2", nil, true];
player setVariable ["restrained", nil, true];
player setVariable ["Escorting", nil, true];
player setVariable ["transporting", nil, true];	

if(jail_money_init && _hours > 1) then {
	_lossMoney = _hours - 1;
	_lossTotal = cash_in_bank;
	_lossTotal = _lossTotal * 0.9;
	["You have been docked 10% of your funds for a 10 year sentence.", false] spawn domsg; 
};

life_is_arrested = true;
player setVariable["life_is_arrested", true, true];
life_battery = 0;
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
	
if(life_bail_amount < 12751) then {
	_lowsecjaillocations = [
	[9295.08,9300.44,0.5143909],
	[9291.98,9304.81,0.5143909],
	[9281.43,9302.13,0.6143909],
	[9283.14,9298.38,0.6143909],
	[9289.01,9310.3,0.5143909]
	];
	_randomer = floor random (count _lowsecjaillocations);
	_jailpos = _lowsecjaillocations select _randomer;
	player setPos _jailpos;
	["You have been sent to County Jail.", false] spawn domsg;
} else {
	_jaillocations = [
	[9631.38,10079.4,0.00143909],
	[9632.74,10082.7,0.00143909],
	[9634.19,10085.7,0.00143909],
	[9635.92,10089.3,0.00143909],
	[9637.38,10092.5,0.00143909],
	[9638.73,10095.5,0.00143909],
	[9640.38,10098.7,0.00143909],
	[9641.92,10102.1,0.00143909],
	[9614.22,10087.1,0.00143909],
	[9616.13,10089.7,0.00143909],
	[9617.63,10093.1,0.00144005],
	[9619.44,10096.3,0.00143909],
	[9620.98,10099.4,0.00144005],
	[9622.66,10102.4,0.00143909],
	[9624.31,10105.4,0.00143909],
	[9625.79,10108.9,0.00143909]
	];
	_randomer = floor random (count _jaillocations);
	_jailpos = _jaillocations select _randomer;
	player setPos _jailpos;
	[format["Your bail is set at: %1", life_bail_amount], false] spawn domsg;
};

uiSleep 2;
[player,"cellclose"] spawn life_fnc_nearestSound;
if((player distance (getMarkerPos "jail_county_1")) > 40 && life_bail_amount < 12751) then
{
	player setPos [9295.08,9300.44,0.5143909];
};

if((player distance (getMarkerPos "jail_marker")) > 40 && life_bail_amount > 12750) then
{
	player setPos (getMarkerPos "jail_marker");
};

("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"]; //show
	
_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#ffffff' align='center' size='0.9'>%1</t>",life_arrestReason];
((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;

[0,_minutes,_hours,0] spawn life_fnc_jailTimer;
cutText ["","BLACK IN"];
if(life_firstSpawn) then {
	life_firstSpawn = false;
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
	(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
	[] execVM "core\init_survival.sqf";
	[] call life_fnc_hudSetup;
	player setVariable ["loaded", true, true];
};