if((call life_coplevel) < 2) exitWith {closeDialog 0; ["You need to be a officer [level 2] to use this function",false,"slow"] call life_fnc_notificationSystem;};
createDialog "police_speaker";