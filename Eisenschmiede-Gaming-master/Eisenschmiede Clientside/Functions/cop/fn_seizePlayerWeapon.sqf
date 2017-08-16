[[],"ES_fnc_seizePlayerWeaponAction",cursorTarget,false] spawn ES_fnc_MP;
titleText format["Greife Waffe von %1", name cursorTarget];
[[52, player, format["%1 wurde entwaffnet", name cursorTarget]],"ES_fnc_logIt",false,false] spawn ES_fnc_MP;
