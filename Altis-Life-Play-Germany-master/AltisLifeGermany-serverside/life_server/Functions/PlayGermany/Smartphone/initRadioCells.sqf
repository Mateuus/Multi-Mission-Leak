private["_i","_cellObj","_cellData"];

_i = -1;
_cellObj = objNull;

PGSERV_mobile_radiocells = [
	// Name, Cell Object, Table Object
	["radio_cell_1",  (nearestObjects[getMarkerPos "radio_cell_1", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_2",  (nearestObjects[getMarkerPos "radio_cell_2", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_3",  (nearestObjects[getMarkerPos "radio_cell_3", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_4",  (nearestObjects[getMarkerPos "radio_cell_4", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_5",  (nearestObjects[getMarkerPos "radio_cell_5", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_6",  (nearestObjects[getMarkerPos "radio_cell_6", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_7",  (nearestObjects[getMarkerPos "radio_cell_7", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_8",  (nearestObjects[getMarkerPos "radio_cell_8", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_9",  (nearestObjects[getMarkerPos "radio_cell_9", ["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_10", (nearestObjects[getMarkerPos "radio_cell_10",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_11", (nearestObjects[getMarkerPos "radio_cell_11",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_12", (nearestObjects[getMarkerPos "radio_cell_12",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_13", (nearestObjects[getMarkerPos "radio_cell_13",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_14", (nearestObjects[getMarkerPos "radio_cell_14",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_15", (nearestObjects[getMarkerPos "radio_cell_15",["Land_Communication_F"],25]) select 0, objNull],
	["radio_cell_16", (nearestObjects[getMarkerPos "radio_cell_16",["Land_Communication_F"],25]) select 0, objNull]
];

for "_i" from 0 to ((count PGSERV_mobile_radiocells) - 1) do
{
    _cellData = PGSERV_mobile_radiocells select _i;
    _cellObj = _cellData select 1;

    if (isNil "_cellObj") then {
        // i fucking hate arma
        _cellObj = objNull;
        (PGSERV_mobile_radiocells select _i) set [1, objNull];
	    diag_log format["%1 initialization failed (_cellObj is nil).", _cellData select 0];
    }
    else
    {
	    if (!(isNull _cellObj)) then {
	        // initialize some stuff
		    _cellObj setVariable["inCapture", false, true];
		    _cellObj setVariable["gangOwner", grpNull, true];
		    _cellObj setVariable["disabled", false, true];
		    _cellObj setVariable["providerFailures", [], true];
            _cellObj setVariable["lastHack", 0, true];
            _cellObj setVariable["lastHackedMsg", 0, true];

            _cellTable = (nearestObjects[getPosATL _cellObj,["OfficeTable_01_old_F"],15]) select 0;
            (PGSERV_mobile_radiocells select _i) set [2, _cellTable];

	        diag_log format["%1 initialized.", _cellData select 0];
	    } else {
	        diag_log format["%1 initialization failed (_cellObj is null).", _cellData select 0];
	    };
    };
};

publicVariable "PGSERV_mobile_radiocells";

PGSERV_mobile_providers = [
	// [Name, Range, Buyprice, SingleFailureChancePercent, MaxSimultaneousSingleFailures, CompleteFailureChancePercent, Hackable, HackEarnPerSimClient, FailSmsTransmissionChancePercent, CostsPerSms, OnlyDonator]
	["Siffy",    2450,       0,  65,  5,  40,   true,   3000,  26,   100,  false],
    ["O3",       2600,   75000,  40,  3,  30,   true,   7000,  19,   400,  false],
    ["E-",       2850,  100000,  30,  2,  10,   true,  12000,  12,   700,  false],
    ["PG",       3000,  250000,   0,  0,   0,   true,  20000,   5,  1000,  false],
    ["SatPhone",   -1,  500000,   0,  0,   0,  false,      0,   0,  2000,  false]
];

// [name, completeFailureActive]
PGSERV_mobile_providers_vars = [];

for "_i" from 0 to ((count PGSERV_mobile_providers) - 1) do
{
    PGSERV_mobile_providers_vars set [_i, [(PGSERV_mobile_providers select _i) select 0, false]];
};

publicVariable "PGSERV_mobile_providers_vars";
publicVariable "PGSERV_mobile_providers";

diag_log "Funkzellen initialisiert!";