/*
	File: fn_p_openMenu.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Opens the players smartphone
*/

private ["_buttons","_display","_sync","_message","_money","_inventory","_button","_text","_lastButton","_time","_hour","_min"];

if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
if(player getVariable ["restrained", false] && (life_adminlevel < 1)) exitWith {hint "You cannot access your phone because your hands are restrained."};
createDialog "smartphone";
disableSerialization;

_display = findDisplay 90000;
_sync = _display displayCtrl 90010;
_message = _display displayCtrl 90020;
_money = _display displayCtrl 90015;
_inventory = _display displayCtrl 90025;

// Hide all conditional buttons
for "_i" from 0 to ((count life_phone_buttons) - 1) do
{
	ctrlShow [90500 + _i, false];
	ctrlShow [90600 + _i, false];
};

// Global buttons
_sync ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='2' image='icons\phone_sync.paa' /><br /><t size='0.6'>Sync</t></t>";
_message ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='2' image='icons\phone_message.paa' /><br /><t size='0.6'>Message</t></t>";
_money ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='2' image='icons\phone_money.paa' /><br /><t size='0.6'>Money</t></t>";
_inventory ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='2' image='icons\phone_phone.paa' /><br /><t size='0.6'>Phone</t></t>";

// Conditional buttons
_lastButton = 0;
{
	if (call compile (_x select 3)) then
	{
		_text = _display displayCtrl (90500 + _lastButton);
		_button = _display displayCtrl (90600 + _lastButton);
		_text ctrlSetStructuredText parseText format["<t align='center' shadow='0'><img size='2' image='%1' /><br /><t size='0.6'>%2</t></t>", _x select 1, _x select 0];
		_text ctrlShow true;
		_button ctrlShow true;
		_button ctrlSetTooltip (_x select 4);
		life_phone_actions set [_lastButton, _x select 2];
		_lastButton = _lastButton + 1;
	};
} forEach life_phone_buttons;

[] spawn
{
	while {!isNull (findDisplay 90000)} do
	{
		[] call life_fnc_p_updateMenu;
		sleep 2;
	};
};