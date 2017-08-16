#include <macro.h>
/*
File: fn_buySim.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Buy action for SIM cards.
*/
private["_provider","_provider_idx","_providerDonatorOnly","_provider_costs"];

_provider = [_this,3,"",[""]] call BIS_fnc_param;

//diag_log format["DEBUG: buySim _provider: %1", _provider];

if (_provider == (player GVAR["mobile_provider",""])) exitWith {
    hint "Du hast bereits eine SIM Karte von diesem Anbieter!";
};

_provider_idx = [_provider, PGSERV_mobile_providers] call TON_fnc_index;
if(_provider_idx == -1) exitWith {
    // provider is not available, should only happen when no provider was bought before
    hint "Fehler: Dieser Netzprovider existiert nicht. Bitte kontaktiere das Support Team";
};

_providerDonatorOnly = SEL(SEL(PGSERV_mobile_providers, _provider_idx), 10);
if (_providerDonatorOnly && !license_civ_donator) exitWith {
    hint "Das Mobilfunknetz dieses Anbieters steht dir leider nicht zur Verfügung.";
};

_provider_costs = 0;
_provider_costs = SEL(SEL(PGSERV_mobile_providers, _provider_idx), 2);

if (CASH < _provider_costs) exitWith {
    hint format["Du hast keine %1€ für eine SIM Karte von %2!", [_provider_costs] call life_fnc_numberText, _provider];
};

SUB(CASH, _provider_costs);
[] call life_fnc_hudUpdate;
player SVAR["mobile_provider", _provider, true];

hint format["Du hast dir für %1€ eine SIM Karte von %2 gekauft.", [_provider_costs] call life_fnc_numberText, _provider];

[8] call SOCK_fnc_updatePartial;