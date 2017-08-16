#include <macro.h>
/*
File: fn_providerNetworkAvailable.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.
 
Description:
Checks if the provider network connection of the SIM card is available.
*/
private["_providerName","_providerIdx","_providerVarsIdx","_providerCompleteFailure","_range","_hackable","_return","_cellRow","_cellName","_cellObj","_cellDisabled","_localFailure","_providerSingleFailures"];

_providerName = player GVAR["mobile_provider", ""];

_providerIdx = [_providerName, PGSERV_mobile_providers] call TON_fnc_index;
_providerVarsIdx = [_providerName, PGSERV_mobile_providers_vars] call TON_fnc_index;
if(_providerIdx == -1 || _providerVarsIdx == -1) exitWith {
    // provider is not available, should only happen when no provider was bought before
    //diag_log format["DEBUG: unknown provider %1", _providerName];
    false;
};

_providerCompleteFailure = SEL(SEL(PGSERV_mobile_providers_vars, _providerVarsIdx), 1);
if (_providerCompleteFailure) exitWith {
    // the provider network is complety failing at the moment, no network available...
    //diag_log "DEBUG: _providerCompleteFailure == true";
    false;
};

//diag_log "DEBUG: checks passed";

_range = SEL(SEL(PGSERV_mobile_providers, _providerIdx), 1);
//diag_log format["DEBUG: range of provider cells are %1m", _range];

_hackable = SEL(SEL(PGSERV_mobile_providers, _providerIdx), 6);
//diag_log format["DEBUG: _hackable = %1", _hackable];

// now we need help from a temp variable... 'cuz arma sucks
_return = false;

// loop over all cells and check if any is available for this player
{
    _cellRow = _x;
    _cellName = SEL(_cellRow, 0);
    _cellObj = SEL(_cellRow, 1);
    
    //diag_log format["DEBUG: cell check for %1", _cellName];
    
    if (!(isNull _cellObj)) then
    {
        _cellDisabled = _cellObj GVAR["disabled", false];
        
        // check if the current cell is not hackable, or when it is hackable that it's not disabled
        if (!(_hackable) || !(_cellDisabled)) then
        {
            //diag_log format["DEBUG: cell %1 is not disabled, continue with checks...", _cellName];
            
            // ########################################
	        // check the range (only when range > 0)
            // ########################################
	        if (_range > 0) then
            {
				if (player distance _cellObj <= _range) then {
		            //diag_log format["DEBUG: cell %1 is in range.", _cellName];
		        	_return = true;
			    } else {
                    //diag_log format["DEBUG: cell %1 is not in range.", _cellName];
                };
	        }
	        else
	        {
	            // this provider is always in range
	            //diag_log format["DEBUG: cell %1 is always in range, because range < 0", _cellName];
                _return = true;
	        };
            
            // ########################################
            // check if the cell got a provider failure
            // only when range is okay
            // ########################################
            if (_return) then
            {
	            _localFailure = false;
	            
	            //diag_log format["DEBUG: loop over all provider failures for cell %1", _cellName];
	            
                _providerSingleFailures = _cellObj GVAR["providerFailures", []];
                
	            // loop over all provider failures for the current cell
	            {
	                // _x is now one of the failing providers for this cell
	                if (_x == SEL(_cellRow, 0)) exitWith
	                {
	                    // oh yes, in this cell the provider is marked as failing at the moment
	                    //diag_log format["DEBUG: cell %1 has a provider failure", _cellName];
	                    _return = false;
	                };
	            } forEach _providerSingleFailures;
            };
        }
        else
        {
            //diag_log format["DEBUG: cell %1 is disabled.", _cellName];
        };
    }
    else
    {
        //diag_log format["DEBUG: cell %1 does not exists on the map", _cellName];
    };
    
    //diag_log format["DEBUG: result for cell %1 is: %2", _cellName, _return];
    
    // hate arma scripting shit... do the break for the forEach loop here to avoid further cell checks
    if (_return) exitWith {
        //diag_log format["DEBUG: cell %1 is ready to serve, abort forEach loop", _cellName];
    };
} forEach PGSERV_mobile_radiocells;

//diag_log "DEBUG: forEach PGSERV_mobile_radiocells passed";

_return;