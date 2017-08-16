if(profileNameSpace getVariable [format["%1_%2_%3",missionName,"EMCODE",getPlayerUID player],false]) exitWith {["Ojé!","Du hast den EM-Code schon eingelöst!","#ff1000","#ffffff",2] call life_fnc_texttiles;};

if(ctrlText 7451 != "EURO2016") exitWith {hint "Der eingegebene Code ist falsch."};

closedialog 0;
profileNamespace setVariable [format["%1_%2_%3",missionName,"EMCODE",getplayerUID player],true];
saveProfileNamespace;

["Olé!","Du erhältst ein EM-Airhorn, einen Fußball und einen EM-SUV.","#ff1000","#ffffff",7] call life_fnc_texttiles;
playsound "airhorn";

["football",1] call life_fnc_handleinvCheck;
sleep 3;
["airhorn",1] call life_fnc_handleinvCheck;
sleep 3;
["C_SUV_01_F",17] spawn life_fnc_createVehicle;