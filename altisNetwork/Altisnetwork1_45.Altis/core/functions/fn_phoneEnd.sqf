life_phone_status = 0;
life_phone_channel = -1;

[[0,2], "Your phone call has ended."] call life_fnc_broadcast;
playSound "PhoneHangup";

[[life_phone_target,objNull,true],"TON_fnc_managePhone",false,false] spawn BIS_fnc_MP;

sleep 0.1;

[[life_phone_caller,objNull,true],"TON_fnc_managePhone",false,false] spawn BIS_fnc_MP;

sleep 0.1;

life_phone_target = objNull;
life_phone_caller = objNull;