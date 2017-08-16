#include <macro.h> 
#define DEBUG 
 
private["_player","_gamble_val_to_jackpot","_king_gamble_casino_is_illegal","_queryResult","_result","_query","_type","_currentJackpotValue","_newJackpotValue","_amount"]; 
_player = param [0,ObjNull,[ObjNull]]; 
_gamble_val_to_jackpot = param [ 1, 0]; 
_king_gamble_casino_is_illegal = param [ 2, 0]; 
 
_type = "Jackpot";  
_query = format["SELECT amount FROM lhm_bank WHERE banktype='%1'",_type]; 
 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
 
_result = call compile format["%1", _queryResult]; 
_amount = (_result select 0); 
 
_currentJackpotValue = _amount; 
 
if (_currentJackpotValue > 200000) then {  
_newJackpotValue = 200000; // Max Jackpot Amount 
} else { 
_currentJackpotValue = _currentJackpotValue + _gamble_val_to_jackpot; 
_newJackpotValue = _currentJackpotValue; 
}; 
 
diag_log format ["GAMBLING: NEW JACKPOT VALUE = %1",_newJackpotValue]; 
 
_amount = _newJackpotValue; 
_query = format["UPDATE lhm_bank SET amount='%1' WHERE banktype='%2'",_amount,_type]; 
 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
