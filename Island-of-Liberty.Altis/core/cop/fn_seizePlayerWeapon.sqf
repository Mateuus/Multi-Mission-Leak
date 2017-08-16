/*
File: fn_seizePlayerWeapon.sqf
    Author: Skalicon
    
    Description:
    Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
[] remoteExec ["life_fnc_seizePlayerWeaponAction",cursorTarget];
//titleText format["Greife Waffe von %1", name cursorTarget];
[52, player, format["%1 wurde entwaffnet", name cursorTarget]] remoteExec ["TON_fnc_logIt",2];
