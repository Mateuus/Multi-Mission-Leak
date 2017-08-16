/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onDeath}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this spawn life_fnc_onRespawn}];
player addEventHandler["Put",{_this spawn life_fnc_moveItem;}];
player addEventHandler["Take", {_this spawn life_fnc_moveItem}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["CommandModeChanged", { if (_this select 0) then { ["epicFail",false,2] call BIS_fnc_endMission; } }];
player addEventHandler["HandleRating", {0}];
player addEventHandler["Fired", {_this call life_fnc_firedHandler}];
spawnHandlerIDT = [["#t", true, true, true], "life_fnc_filterChat"] call aniChatEvents_addEventHandler;
spawnHandlerIDR = [["#r", true, true, true], "life_fnc_filterChat"] call aniChatEvents_addEventHandler;
spawnHandlerIDR = [["#e", true, true, true], "life_fnc_emote"] call aniChatEvents_addEventHandler;
spawnHandlerIDR = [["#f", true, true, true], "life_fnc_face"] call aniChatEvents_addEventHandler;

if (!isDedicated) then { waitUntil {!(isNull player)}; };

//"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"life_capture_list" addPublicVariableEventHandler {if (life_capture_zone > 0) then { [] call life_fnc_updateCaptureUI; };};
"life_bank_lastRobbed" addPublicVariableEventHandler { life_bank_lastRobbed = time; };
"life_topWealth" addPublicVariableEventHandler { [life_topWealth] spawn life_fnc_welcomeCredits; };
"life_bank_robbers" addPublicVariableEventHandler
{
	if (count life_bank_robbers < 1) exitWith {};
	if (playerSide != west) exitWith {};
	_i = 1;
	_names = "Identified reserve suspects: ";
	{
		_names = format["%1%2", _names, name _x];
		if (_i < (count life_bank_robbers)) then { _names = format["%1, ", _names]; };
		_i = _i + 1;
	} forEach life_bank_robbers;
	systemChat _names;
};
"life_configuration" addPublicVariableEventHandler {_this spawn life_fnc_configChanged};
"life_chopVehicle" addPublicVariableEventHandler
{
	[false] spawn life_fnc_updateChopTask;
};
"life_allpoints" addPublicVariableEventHandler
{
	if (count life_allpoints == 0 && playerSide == west) exitWith { hint "The current APB has been lifted!"; [] call life_fnc_hudUpdate; };
	if (count life_allpoints == 0) exitWith {};
	if (getPlayerUID player == life_allpoints select 1) exitWith { ["AllPointsBulletin",["APB issued for YOUR arrest!"]] call BIS_fnc_showNotification; [] call life_fnc_hudUpdate; };
	if (playerSide != west) exitWith {};
	["AllPointsBulletin",[format["APB issued for arrest of %1!", life_allpoints select 0]]] call BIS_fnc_showNotification;
	[] call life_fnc_hudUpdate;
	[life_allpoints select 1] spawn life_fnc_trackBounty;
};
"life_phone_channel" addPublicVariableEventHandler
{
	_message = if (life_phone_channel < 0) then { "Your phone call has ended." } else { "Phone link established!" };
	[[0,2], _message] call life_fnc_broadcast;
	if (life_phone_channel > -1) then { life_phone_status = 3; setCurrentChannel life_phone_channel; };
};
"life_active_turf" addPublicVariableEventHandler
{
	private ["_turf"];
	if (life_gang == "0") exitWith {};
	if (life_active_turf < 0) exitWith { hint "Gang turf is no longer available for capture!"; };
	[] spawn
	{
		private ["_distance"];
		while {life_active_turf > -1} do
		{
			_distance = 1000;
			if (worldName == "Stratis") then { _distance = 400; };
			if (player distance (getMarkerPos format["turf_label_%1", life_active_turf + 1]) < _distance) exitWith
			{
				[1, "<t color='#FF0000'>YOU'VE ENTERED A GANG TURF WAR REGION!</t> This is a temporary illegal area during an active turf battle. When the circle on the map turns yellow, it's safe to enter. <t color='#FF0000'>RDM rules do NOT APPLY.</t>"] call life_fnc_broadcast;
				[[0,2], "YOU'VE ENTERED A GANG TURF WAR REGION! RDM rules do NOT APPLY while the circle is red."] call life_fnc_broadcast;
			};
			sleep 5;
		};
	};
	_turf = life_turf_list select life_active_turf;
	hint parseText format["<t color='#ff0000'><t size='2'><t align='center'>Gang Turf<br/><br/><t size='1'><t color='#ffffff'>The gang turf at <t color='#ff0000'>%1</t> is <t color='#ff0000'>now vulnerable to capture</t> for the next 15 minutes! Any gang member can capture it by using the flag at that location.", _turf select 0];
	systemChat format["The gang turf at %1 is now vulnerable to capture for the next 15 minutes! Any gang member can capture it by using the flag at that location.", _turf select 0];
};
"life_turf_list" addPublicVariableEventHandler
{
	[] spawn life_fnc_updateTurfMarkers;
};
"life_active_event" addPublicVariableEventHandler
{
	if (playerSide != civilian) exitWith {};
	if (count life_active_event == 0) exitWith
	{
		if (!isNil "life_event_startpos") then
		{
			player setPos life_event_startpos;
			life_event_startpos = nil;
		};
	};
	_event = life_active_event select 0;
	_start = life_active_event select 1;
	_pending = life_active_event select 2;
	_title = switch (_event) do
	{
		case 5: { "Kart race" };
		case 6: { "Laser tag" };
		default { format ["%2 race %1", _event, if (surfaceIsWater (getMarkerPos format["race_%1_start", _event])) then { "Water" } else { "Rally" }] };
	};
	if (_pending) then
	{
		_provided = if (_event == 6) then { "Equipment" } else { "The winner will receive $3,000. A vehicle" };
		["NewEvent",[format["%1 is starting soon, join up!",_title]]] call BIS_fnc_showNotification;
		[[0,1],format["%1 will begin in 5 minutes. Visit a tourism center in any town to join up. %2 will be provided.", _title, _provided]] call life_fnc_broadcast;
		[2,format["%1 will begin in 5 minutes.", _title]] call life_fnc_broadcast;
	};
};
"life_dispatchTasks" addPublicVariableEventHandler
{
	if (isNil "life_dispatcher") exitWith {};
	if (life_dispatcher != player) exitWith {};
	disableSerialization;
	lbClear _taskList;
	_taskList = (findDisplay 39500) displayCtrl 39514;
	{
		_taskList lbAdd (_x select 1);
		_taskList lbSetData [(lbSize _taskList)-1, str _x];
	} forEach life_dispatchTasks;
	_taskList lbSetCurSel -1;
};
"life_stock_change" addPublicVariableEventHandler
{
	{
		if (_x select 0 == life_stock_change select 0) exitWith
		{
			life_price_index set [_forEachIndex, [life_stock_change select 0, life_stock_change select 1]];
		}
	} forEach life_price_index;
	if  (!isNull (findDisplay 38400)) then
	{
		[(findDisplay 38400) displayCtrl 38403, lbCurSel 38403] call life_fnc_simpleShopSelection;
	};
	if  (!isNull (findDisplay 39400)) then
	{
		[(findDisplay 39400) displayCtrl 39403, lbCurSel 39403] call life_fnc_weaponShopSelection;
	};
};