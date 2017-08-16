/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Increases/resets a players weight
*/

params [["_toggle",false,[false]]];

//Toggle their carry weight
if(_toggle)exitWith {
    if(player getVariable ["weightIncreased",false])then {
        hint "The admins have reset your carry weight back to it's default value";
        systemChat "The admins have reset your carry weight back to it's default value.";

        if(!((backpack player) isEqualTo ""))then {
        	_cfg = getNumber (configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
        	_load = round (_cfg / 8);
        	DS_maxWeight = (24 + _load);
        } else {
            DS_maxWeight = 24;
        };

        player setVariable ["weightIncreased",nil,true];
    } else {
        player say3D "success";

        hint "The admins have increased your carry weight so you can quickly process/sell before a server restart";
        systemChat "The admins have increased your carry weight so you can quickly process/sell before a server restart";

        DS_maxWeight = 5000;

        player setVariable ["weightIncreased",true,true];
    };
};

//Force their carry weight to 5000
player say3D "success";

hint "The admins have increased your carry weight so you can quickly process/sell before a server restart";
systemChat "The admins have increased your carry weight so you can quickly process/sell before a server restart";

DS_maxWeight = 5000;

player setVariable ["weightIncreased",true,true];