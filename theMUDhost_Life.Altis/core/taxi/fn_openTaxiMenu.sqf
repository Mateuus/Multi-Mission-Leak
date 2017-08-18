
disableSerialization;
createDialog "life_taxiMenu";
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;

if (!life_isOnDutyTaxi) exitWith {hint "You are not on duty or you already accepted a request!";closeDialog 0;};

[[player],"TON_fnc_goOnDuty",false,false] spawn life_fnc_mp;
sleep 1;
if (count TaxiCallsClient > 0) then
{
	{
		_taxiListbox lbAdd format ["%1 (%2 meters)",name _x,(_x distance player)];
		_taxiListbox lbSetData [(lbSize _taxiListbox)-1,format ["%1",_x]];
	} forEach TaxiCallsClient;
};

hint "Successfully loaded current taxirequests, please select one to continue.";