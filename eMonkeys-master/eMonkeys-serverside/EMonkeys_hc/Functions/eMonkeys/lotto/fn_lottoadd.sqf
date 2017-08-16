private["_uid"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
 
if (count lotto_spieler==0&&lotto_spielstatus==0) then { 
    [] spawn TON_fnc_lotto; 
    lotto_spielstatus = 1; 
}; 
 
if (lotto_spielstatus==1) then { 
    _uidarr = [_uid]; 
    lotto_spieler = lotto_spieler + _uidarr; 
    [[3,"Du nimmst jetzt an der nächsten Lottoziehung teil!"],"EMonkeys_fnc_lotto_response",_uid,false] call EMonkeys_fnc_mp; 
}; 
 
