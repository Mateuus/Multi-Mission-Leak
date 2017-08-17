if((call life_coplevel) < 5) exitWith {closeDialog 0; ["You need to be a captain to use this function.",false,"slow"] call life_fnc_notificationSystem;};

"Kavala Lockdown Ended - You may continue with your lives as normal, thankyou for your participation." remoteExecCall ["hint",0];

