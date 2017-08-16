/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_exit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

[] call lhm_fnc_saveGearA3;

//LHM DonatorWeaponDrop START
player call lhm_fnc_DropDonWeapon;
//LHM DonatorWeaponDrop END

_exit = {
    for "_i" from 1 to 6 do {
        closeDialog 0;
        sleep 0.2;
    };
    waitUntil {(!isNull (findDisplay 602))};
    closeDialog 0;
    closeDialog 0;
};


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	hint localize "STR_MISC_Backpack";
	[_exit] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[] spawn (_this select 0);
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in lhm_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[_exit] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			[] spawn (_this select 0);
		};
	};
};

//////// LHM BASEBUILD START ////////
if((typeOf _container) == "B_CargoNet_01_ammo_F") exitWith {

// no gang
if (isNil "lhm_gangData") exitWith {
	Hint "DU darfst diese Kiste nicht öffnen!";
	[_exit] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[] spawn (_this select 0);
		};
};

// in a gang but not a member
if ((_container getVariable ["gangarea_id", -1]) != (lhm_gangData select 0)) exitWith {
	Hint "DU darfst diese Kiste nicht öffnen!";
	[_exit] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[] spawn (_this select 0);
		};

};

// was in a gang or all other cases
if ((count lhm_gangData) == 0) exitWith {
	Hint "DU darfst diese Kiste nicht öffnen!";
	[_exit] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[] spawn (_this select 0);
		};
};

[_unit,_container] spawn {
	waitUntil {!isNull (findDisplay 602)};
	private ["_unit", "_container", "_limitItemCargo", "_limitWeaponCargo", "_limitbackpackCargo", "_limitMagazineCargo", "_items", "_weapons", "_backpacks", "_magazines", "_wFill", "_iFill", "_bFill", "_mFill", "_ovFill"];
	_unit = _this select 0;
	_container = _this select 1;

	_limitItemCargo = 145;
	_limitWeaponCargo = 132;
	_limitbackpackCargo = 12;
	_limitMagazineCargo = 704;

	while {!isNull (findDisplay 602)} do {
		// Monitoring storage box
		_items = count itemcargo _container;
		_weapons = count weaponcargo _container;
		_backpacks = count backpackCargo _container;
		_magazines = count magazinecargo _container;

		_wFill = (_weapons / _limitWeaponCargo) * 100;
		_iFill = (_items / _limitItemCargo) * 100;
		_bFill = (_backpacks / _limitbackpackCargo) * 100;
		_mFill = (_magazines / _limitMagazineCargo) * 100;
		_ovFill = ((_weapons + _items + _backpacks + _magazines + _weapons) / (_limitItemCargo + _limitWeaponCargo + _limitbackpackCargo + _limitMagazineCargo)) * 100;

		hintSilent parseText format
		[
		"
		<t size='1.35' font='puristaLight'align='center'color='#ADFF2F'>Storage Box Fill Status</t><br/><br/>
		<t size='1.1'font='puristaLight'align='left'color='#FF4500'>Weapons : <t align='right' color='#D4D4D4'>%1 Percent</t></t> <br/>
		<t size='1.1'font='puristaLight'align='left'color='#FF4500'>Items : <t align='right'color='#D4D4D4'>%2 Percent</t></t> <br/>
		<t size='1.1'font='puristaLight'align='left'color='#FF4500'>Backpacks : <t align='right'color='#D4D4D4'>%3 Percent</t></t> <br/>
		<t size='1.1'font='puristaLight'align='left'color='#FF4500'>Magazines : <t align='right'color='#D4D4D4'>%4 Percent</t></t> <br/><br/>
		<t size='1.1'font='puristaLight'align='left'color='#FF4500'>Overall Status : <t align='right'color='#D4D4D4'>%5 Percent</t></t>
		",
		round _wFill,
		round _iFill,
		round _bFill,
		round _mFill,
		round _ovFill
		];

		sleep 0.1;
	};
	Hintsilent "";
};

};
//////// LHM BASEBUILD END /////////

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in lhm_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[_exit] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			[] spawn (_this select 0);
		};
	};
};

if(_container isKindOf "Box_NATO_Wps_F")then{
	_pidcon=_container getVariable ["owner_PID","0"];
	_ownboxes = [] call lhm_fnc_getEventBoxes;
	switch (true) do
	{
		case (_pidcon=="0" && (count _ownboxes)==0):
		{
			_container setVariable ["owner_PID",getPlayerUID player,true];
			hint "Das ist jetzt dein Schließfach!";
			_container setVariable ["realname","dein Schließfach"];
			//_container setVariable ["realname","dein Schließfach",true];
			//titleTExt["Inventar sollte sich jetzt NICHT schließen (1)", "PLAIN"];
		};
		case (_pidcon=="0" && (count _ownboxes)!=0):
		{
			hint "Du hast bereits ein Schließfach!";
			//titleTExt["Inventar sollte sich jetzt schließen (2)", "PLAIN"];
			[_exit] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			[] spawn (_this select 0);
			};
		};
		case (_container in _ownboxes):
		{
			hint "Schließfach geöffnet";
		//	titleTExt["Inventar sollte sich jetzt NICHT schließen (3)", "PLAIN"];
		};

		default
		{
			hint "DU kanns dieses Schließfach nicht öffnen!";
		//	titleTExt["Inventar sollte sich jetzt schließen (4)", "PLAIN"];
  			[_exit] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			[] spawn (_this select 0);
			};
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[_exit] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[] spawn (_this select 0);
	};
};