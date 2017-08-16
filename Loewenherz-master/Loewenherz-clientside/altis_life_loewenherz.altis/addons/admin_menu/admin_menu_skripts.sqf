/*
    File: admin_menu_skripts.sqf
    Author: Barney

    Description:
    BLAH!!

    Einfügen neuer Befehle:
    [Name des Skriptes in der Listbox vom Menü, Skriptname als string oder Code sofern dieses schon iwo definiert ist, 0 = man muss dafür keinen Spieler ausgewählt haben /1= das Gegenteil, Nur benötig wenn Skript schon iwo definiert hier stehen die "Aufrufparamater" für das Skript]

    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    Usage of this file is restricted to permitted servers e.g. Loewenherz.
    Ask us for permission to use this file: www.lhzp.de
*/



private ["_was","_lvl","_return","_array"];

_was = param [0,-1,[0]];
_aufbau = param[1,false,[false]];
_lvl = call lhm_adminlevel;
if(!(_lvl  in [1,2,3,4])) exitWith {hint "Kein Admin oder falsches LVL!"};

_return = [];

if(_lvl == 1) then {

    _array = [
		["-=== TOOLS ===-"],
        ["Old Admin Menu","admin_menu_old.sqf",0],
		["Admin MessageBox","msg_dialog.sqf",0],
		["Give Money","addMoney.sqf",0],
		["Add Nitro","addInjection.sqf",0],

        ["-=== Player Options ===-"],
        ["Specate Player","spectate.sqf",1],
        ["INFIZIEREN (SELECT PLAYER)","infect.sqf",1],
		["Anti Virus (ALL PLAYER)","antiVirus.sqf",0],
        ["Freeze/Unfreeze Player (SELECT PLAYER)","playerfreeze.sqf",1],

        ["-=== EVENTS ===-"],
        ["Money Transporter","mt.sqf",0],
        ["Kavala Power Off","po.sqf",0],
        ["SEC - Geldtransport","secmoneyevent.sqf",0],
        ["Spawn eventlockers","eventlocker.sqf",0],


		["-=== Fun Stuff ===-"],
        ["Rainbow Smoke at Feet","silly.sqf",0]
    ];


};

if(_lvl == 2) then {

      _array = [
        ["-=== TOOLS ===-"],
        ["Force Disconnect","forceDisconnect.sqf",0],
        ["Old Admin Menu","admin_menu_old.sqf",0],
        ["Admin MessageBox","msg_dialog.sqf",0],
        ["Custom Building Menu","buildingdialog.sqf",0],
        ["Give Money","addMoney.sqf",0],
        ["Spawn Vehicle",VVS_fnc_openVVS,0,["","Car"]],
        ["Set Licenses","setLicenses.sqf",0],
        ["Show Pricelist","pricelist.sqf",0],
        ["Heal","heal.sqf",0],
        ["GodMone","gm.sqf",0],
        ["Tele/Esp on/off","teleesp.sqf",0],
		["Add Nitro","addInjection.sqf",0],

        ["-=== Player Options ===-"],
        ["Kill Player","playerkill.sqf",1],
        ["TP to Player","playerteleto.sqf",1],
        ["TP Player to u","playerteletoyou.sqf",1],
        ["Specate Player","spectate.sqf",1],
        ["INFIZIEREN","infect.sqf",1],
		["Anti Virus (ALL PLAYER)","antiVirus.sqf",0],
        ["Freeze/Unfreeze Player","playerfreeze.sqf",1],

        ["-=== EVENTS ===-"],
        ["Kavala Defense","kd.sqf",0],
        ["The Purge","purge.sqf",0],
        ["Little Boy","nuke.sqf",0],
        ["Money Transporter","mt.sqf",0],
        ["Beach Party","bp.sqf",0],
        ["Kavala Power Off","po.sqf",0],
        ["Eventfahnen","eventflag.sqf",0],
        ["SEC - Geldtransport","secmoneyevent.sqf",0],
        ["Spawn Ammobox","crate.sqf",0],
        ["INIT BattleRoyale","BR_init.sqf",0],
        ["Start BattleRoyale","BR_start.sqf",0],
        ["Delete BattleRoyale objs","BR_delete.sqf",0],
        ["Spawn eventlockers","eventlocker.sqf",0],

        ["-=== Fun Stuff ===-"],
        ["Rainbow Smoke at Feet","silly.sqf",0],
        ["Rainbow Smoke on Map","rainbow.sqf",0],
        ["Fireworks on Map","fireworks.sqf",0],
        ["Rainbow Flares on Map","flare.sqf",0],

        ["-=== Gang Hideout ===-"],
        ["Create Hideout Point","createHideout.sqf",0],
        ["get Gang ID (SELECT PLAYER)","getGangID.sqf",1],
        ["Get Base Price(near Base)","get_base_price.sqf",0],

        ["-=== Server Options ===-"],
        ["Init Zeus","playCurator.sqf",0],
        ["Remove Playersmarkers","removePlayerMarkers.sqf",0],
        ["[WHITELIST] on/off","switchWhitelist.sqf",0],
        ["Switch Day/Night","changetime.sqf",0],
        ["Remove Base(near Basepoint)","removeHideout.sqf",0],

        ["-=== Weapons and Items ===-"],
        ["Inf. Ammo","infammo.sqf",0],
        ["Add Ammunition (cur. Weapon)","magazine.sqf",0]
    ];

};


if(_lvl == 3) then {

        _array = [
        ["-=== TOOLS ===-"],
        ["Force Disconnect","forceDisconnect.sqf",0],
        ["Old Admin Menu","admin_menu_old.sqf",0],
        ["Admin MessageBox","msg_dialog.sqf",0],
        ["Custom Building Menu","buildingdialog.sqf",0],
        ["Give Money","addMoney.sqf",0],
        ["Spawn Vehicle",VVS_fnc_openVVS,0,["","All"]],
        ["Set Licenses","setLicenses.sqf",0],
        ["Show Pricelist","pricelist.sqf",0],
        ["Heal","heal.sqf",0],
        ["GodMone","gm.sqf",0],
        ["Tele/Esp on/off","teleesp.sqf",0],
        ["Virtual AB","VAS\open.sqf",0],
        ["Invisible on/off","invis.sqf",0],
        ["Script Console","startconsole.sqf",0],
        ["Barney´s Console",lhm_fnc_init_scripting_console,0,[]],
		["Add Nitro","addInjection.sqf",0],

        ["-=== Player Options ===-"],
        ["Kill Player","playerkill.sqf",1],
        ["TP to Player","playerteleto.sqf",1],
        ["TP Player to u","playerteletoyou.sqf",1],
        ["Specate Player","spectate.sqf",1],
        ["INFIZIEREN","infect.sqf",1],
		["Anti Virus (ALL PLAYER)","antiVirus.sqf",0],
        ["Freeze/Unfreeze Player","playerfreeze.sqf",1],

        ["-=== EVENTS ===-"],
        ["Kavala Defense","kd.sqf",0],
        ["The Purge","purge.sqf",0],
        ["Little Boy","nuke.sqf",0],
        ["Money Transporter","mt.sqf",0],
        ["Beach Party","bp.sqf",0],
        ["Kavala Power Off","po.sqf",0],
        ["Eventfahnen","eventflag.sqf",0],
        ["SEC - Geldtransport","secmoneyevent.sqf",0],
        ["Spawn Ammobox","crate.sqf",0],
        ["INIT BattleRoyale","BR_init.sqf",0],
        ["Start BattleRoyale","BR_start.sqf",0],
        ["Delete BattleRoyale objs","BR_delete.sqf",0],
        ["Spawn eventlockers","eventlocker.sqf",0],

        ["-=== Fun Stuff ===-"],
        ["Rainbow Smoke at Feet","silly.sqf",0],
        ["Rainbow Smoke on Map","rainbow.sqf",0],
        ["Fireworks on Map","fireworks.sqf",0],
        ["Rainbow Flares on Map","flare.sqf",0],

        ["-=== Gang Hideout ===-"],
        ["Create Hideout Point","createHideout.sqf",0],
        ["get Gang ID (SELECT PLAYER)","getGangID.sqf",1],
        ["Get Base Price(near Base)","get_base_price.sqf",0],

        ["-=== Server Options ===-"],
        ["Init Zeus","playCurator.sqf",0],
        ["Remove Playersmarkers","removePlayerMarkers.sqf",0],
        ["[WHITELIST] on/off","switchWhitelist.sqf",0],
        ["Switch Day/Night","changetime.sqf",0],
        ["Remove Base(near Basepoint)","removeHideout.sqf",0],

        ["-=== Weapons and Items ===-"],
        ["Inf. Ammo","infammo.sqf",0],
        ["Add Ammunition (cur. Weapon)","magazine.sqf",0]
    ];

};


if(_lvl == 4) then {

        _array = [
        ["-=== TOOLS ===-"],
        ["Force Disconnect","forceDisconnect.sqf",0],
        ["Old Admin Menu","admin_menu_old.sqf",0],
        ["Admin MessageBox","msg_dialog.sqf",0],
        ["Custom Building Menu","buildingdialog.sqf",0],
        ["Give Money","addMoney.sqf",0],
        ["Spawn Vehicle",VVS_fnc_openVVS,0,["","All"]],
        ["Set Licenses","setLicenses.sqf",0],
        ["Show Pricelist","pricelist.sqf",0],
        ["Heal","heal.sqf",0],
        ["GodMone","gm.sqf",0],
        ["Tele/Esp on/off","teleesp.sqf",0],
        ["Virtual AB","VAS\open.sqf",0],
        ["Invisible on/off","invis.sqf",0],
        ["Script Console","startconsole.sqf",0],
        ["Barney´s Console",lhm_fnc_init_scripting_console,0,[]],
		["Add Nitro","addInjection.sqf",0],

        ["-=== Player Options ===-"],
        ["Kill Player","playerkill.sqf",1],
        ["TP to Player","playerteleto.sqf",1],
        ["TP Player to u","playerteletoyou.sqf",1],
        ["Specate Player","spectate.sqf",1],
        ["INFIZIEREN","infect.sqf",1],
		["Anti Virus (ALL PLAYER)","antiVirus.sqf",0],
        ["Freeze/Unfreeze Player","playerfreeze.sqf",1],

        ["-=== EVENTS ===-"],
        ["Kavala Defense","kd.sqf",0],
        ["The Purge","purge.sqf",0],
        ["Little Boy","nuke.sqf",0],
        ["Money Transporter","mt.sqf",0],
        ["Beach Party","bp.sqf",0],
        ["Kavala Power Off","po.sqf",0],
        ["Eventfahnen","eventflag.sqf",0],
        ["SEC - Geldtransport","secmoneyevent.sqf",0],
        ["Spawn Ammobox","crate.sqf",0],
        ["INIT BattleRoyale","BR_init.sqf",0],
        ["Start BattleRoyale","BR_start.sqf",0],
        ["Delete BattleRoyale objs","BR_delete.sqf",0],
        ["Spawn eventlockers","eventlocker.sqf",0],

        ["-=== Fun Stuff ===-"],
        ["Rainbow Smoke at Feet","silly.sqf",0],
        ["Rainbow Smoke on Map","rainbow.sqf",0],
        ["Fireworks on Map","fireworks.sqf",0],
        ["Rainbow Flares on Map","flare.sqf",0],

        ["-=== Gang Hideout ===-"],
        ["Create Hideout Point","createHideout.sqf",0],
        ["get Gang ID (SELECT PLAYER)","getGangID.sqf",1],
        ["Get Base Price(near Base)","get_base_price.sqf",0],

        ["-=== Server Options ===-"],
        ["Init Zeus","playCurator.sqf",0],
        ["Remove Playersmarkers","removePlayerMarkers.sqf",0],
        ["[WHITELIST] on/off","switchWhitelist.sqf",0],
        ["Switch Day/Night","changetime.sqf",0],
        ["Remove Base(near Basepoint)","removeHideout.sqf",0],

        ["-=== Weapons and Items ===-"],
        ["Inf. Ammo","infammo.sqf",0],
        ["Add Ammunition (cur. Weapon)","magazine.sqf",0],

        ["-=== DB Stuff ===-"],
        ["DB Test","dbtest.sqf",0],
        ["WL-Menü",lhm_fnc_admin_wled_menu_open,0,[]]
    ];

};



if(!_aufbau) then {
    if(count(_array)<= _was) then
        {
            _return = [];
        } else
        {
            _return = _array select _was;
        };
} else {
    _return = _array;
};


_return;