closeDialog 0;
AS_received = false;
[[player],"TON_fnc_getActions",false,false] spawn life_fnc_mp;
waitUntil {AS_received};
if (AS_level < 1) exitWith {hint "You have not been whitelisted for the Admin-Panel";};

closeDialog 0;
waitUntil {createDialog "AS_menu";};

if (isNil {["B_Soldier_A_F"] call VAS2_fnc_fetchCfgDetails}) then {

	VAS2_fnc_fetchCfgDetails = {

			/*@version: 1.3
			@file_name: fn_fetchCfgDetails.sqf
			@file_author: TAW_Tonic
			@file_edit: 6/22/2013
			@file_description: Fetch information about the entities config

			USAGE:
			[Classname,Cfg* (Optional)] call VAS_fnc_fetchCfgDetails;

			Return:
			0: classname
			1: displayname
			2: picture
			3: scope
			4: type
			5: itemInfo Type (if any)
			6: Cfg Location i.e CfgWeapons
			7: Magazines
			8: Muzzles
			9: Short Description
			10: acc_Pointers
			11: acc_Optics
			12: acc_Muzzles*/

		private["_entity","_cfg","_ret","_type","_acc_p","_acc_o","_acc_m","_scope","_displayName","_picture","_config","_itemInfo","_muzzles","_magazines","_desc"];
		_entity = _this select 0;
		_acc_p = [];
		_acc_m = [];
		_acc_o = [];
		_magazines = [];
		_muzzles = [];
		_type = "";
		_itemInfo = "";
		_scope = 0;
		if(_entity == "") exitWith {[]};
		_cfg = if(isNil {_this select 1}) then
		{
			switch (true) do
			{
				case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
				case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
				case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
				case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
			};
		}
			else
		{
			_this select 1
		};

		//Final Check

		_ret = [];
		if(typeName _cfg != "STRING") exitWith {[]}; //Not a config
		if(!isClass (configFile >> _cfg >> _entity)) exitWith {[]};
		if(_cfg == "") exitWith {[]}; //Not a config, who is passing bad data?

		_config = configFile >> _cfg >> _entity;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_desc = getText(_config >> "descriptionshort");

		switch (_cfg) do
		{
			case "CfgVehicles":
			{
				_type = getText(_config >> "vehicleClass");
				_scope = getNumber(_config >> "scope");
			};

			case "CfgWeapons":
			{
				_scope = getNumber(_config >> "scope");
				_type = getNumber(_config >> "type");
				_desc = getText(_config >> "descriptionshort");

				//Compatible attachments
				if(isClass (_config >> "WeaponSlotsInfo")) then
				{
					if(isClass (_config >> "WeaponSlotsInfo")) then
					{
						_acc_p = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
						_acc_o = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
						_acc_m = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
					};
				};

				if(isClass (_config >> "ItemInfo")) then
				{
					_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
				};
				_muzzles = getArray(_config >> "muzzles");
				_magazines = getArray(_config >> "magazines");
				if(!isNil {_muzzles}) then
				{
					private["_tmp","_base"];
					_base = inheritsFrom (configFile >> "CfgWeapons" >> _entity);
					{
						if(_x != "this") then
						{
							_tmp = getArray(_base >> _x >> "magazines");
							{
								_magazines set[count _magazines, _x];
							} foreach (_tmp);
						};
					} foreach _muzzles;
				};
			};

			case "CfgMagazines":
			{
				_scope = getNumber(_config >> "scope");
			};
		};

		_ret = [_entity,_displayName,_picture,_scope,_type,_itemInfo,_cfg,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m];
		_ret;
	};
};

disableSerialization;
_playersLB = (findDisplay 16000) displayCtrl 16001;
_actionsLB = (findDisplay 16000) displayCtrl 16002;

_players = [];
{
	if (isPlayer _x) then
	{
		_players pushBack _x;
	}
} forEach playableUnits;
{
	if (vehicle _x == _x) then
	{
		if (currentWeapon _x != "") then {
			_playersLB lbAdd format ["%1 [WEAPON: %2] ",name _x,(([currentWeapon _x] call VAS2_fnc_fetchCfgDetails) select 1)];
			_playersLB lbSetPicture [(lbSize _playersLB)-1, (([currentWeapon _x] call VAS2_fnc_fetchCfgDetails) select 2)];
		} else {
			_playersLB lbAdd format ["%1",name _x];
			if (uniform _x != "") then {
				_playersLB lbSetPicture [(lbSize _playersLB)-1, (([uniform _x] call VAS2_fnc_fetchCfgDetails) select 2)];
			};
		};
		_playersLB lbSetPictureColor [(lbSize _playersLB)-1, [1, 1, 1, 1]];
	} else {
		_playersLB lbAdd format ["%1 [IN: %2]",name _x,vehicle _x];
		if (uniform _x != "") then {
			_playersLB lbSetPicture [(lbSize _playersLB)-1, (([uniform _x] call VAS2_fnc_fetchCfgDetails) select 2)];
			_playersLB lbSetPictureColor [(lbSize _playersLB)-1, [1, 1, 1, 1]];
		};
		//_playersLB lbSetPicture [(lbSize _playersLB)-1, ((vehicle _x) call ISSE_Cfg_VehicleInfo) select 3];
		//_playersLB lbSetPictureColor [(lbSize _playersLB)-1, [1, 1, 1, 1]];
	};
	_playersLB lbSetData [(lbSize _playersLB)-1,format ["%1",_x]];
} forEach _players;
{
	_actionsLB lbAdd _x;
} forEach AS_actions;