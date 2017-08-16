#include <macro.h> 
#define DEBUG 
 
// Send Jackpot Money to the winner 
 
private["_player","_king_gamble_casino_is_illegal","_queryResult","_amount","_currentJackpotValue","_newamount","_query","_type"]; 
_player = param [0,ObjNull,[ObjNull]]; 
_king_gamble_casino_is_illegal = param [ 1, 0]; 
 
If (_player == ObjNull) exitWith {diag_log "GAMBLING: No receiver was defined!"}; 
 
_type = "Jackpot";  
_query = format["SELECT amount FROM lhm_bank WHERE banktype='%1'",_type]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
 
_result = call compile format["%1", _queryResult]; 
_amount = (_result select 0); 
_currentJackpotValue = _amount; 
_casinoJackpot = _currentJackpotValue; 
 
// Send Money to Winner 
[_casinoJackpot,"lhm_fnc_gamblingWonJackpot",_player,false,true] call lhm_fnc_mp; 
diag_log format ["GAMBLING: %1 won the Jackpot of %2",_player,_casinoJackpot]; 
 
_newamount = 0; // Reset Jackpot 
_query = format["UPDATE lhm_bank SET amount='%1' WHERE banktype='%2'",_newamount,_type]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
diag_log format ["GAMBLING: JACKPOT RESET TO %1$",_newamount]; 
