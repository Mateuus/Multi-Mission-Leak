    //
    //	@file Author: TAW_Tonic
    //	@edit Author: ionstorm66
    //
    private["_mags","_weps","_items","_packs","_resupply","_resupply_time","_type","_boxn","_bType","_cfgweapons","_weapons","_magazines","_cur_wep","_classname","_wep_type","_scope","_picture","_items","_backpacks","_bpos","_bdir","_local"];
    //**************************************************************************//
    //
    //					Options
    //
    //**************************************************************************//
     
    // What the box should look like
    _bType = "Box_NATO_Wps_F";
     
    // What kind of box
    //	0 = Weapons and Mags, Items, Backpacks
    //	1 = Weapons and Mags
    //	2 = Items
    //	3 = Packs
    _type = 0;
     
    // Make box resupply every X seconds
    //	Default resupplies it every 5 minutes.
    _resupply = false;
    _resupply_time = (60 * 5);
     
    // Spawn the box local or remote
    //	_local = false; // Spawn local
    _local = true; // Spawn normal
    _local = false;
     
    // How many of each item to spawn
    //	Don't spawn to many, can cause your game to lag if you spawn a ton.
    _mags = 20;
    _weps = 5; 
    _items = 5;
    _packs = 5;
     
     
    _bdir = getdir player;
    _bpos = getposATL player;
    _bpos = [(_bpos select 0)+1*sin(_bdir),(_bpos select 1)+1*cos(_bdir), (_bpos select 2)];
    if (_local) then {
    	_boxn = _bType createVehiclelocal _bpos;
    } else {
    	_boxn = _bType createVehicle _bpos;
    };
    _boxn setDir _bdir;
    _boxn setposATL _bpos;
     
    clearWeaponCargo _boxn;
    clearMagazineCargo _boxn;
    clearItemCargo _boxn;
    clearBackpackCargo _boxn;
     
     
    switch (_type) do
    {
    	//Master ammo crate (EVERYTHING).
    	case 0:
    	{	
    		_cfgweapons = configFile >> "CfgWeapons";
    		_weapons = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_weapons set[count _weapons, _classname];
    				};
    			};
    		};
    		
    		_cfgweapons = configFile >> "CfgMagazines";
    		_magazines = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				//_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
    				{
    					_magazines set[count _magazines, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addWeaponCargo [_x,_weps]; } foreach _weapons;
    		{ _boxn addMagazineCargo [_x,_mags]; }foreach _magazines;
    	
    		_cfgweapons = configFile >> "CfgWeapons";
    		_items = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    				if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_items set[count _items, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addItemCargo [_x,_items]; } foreach _items;
    		
    			_cfgweapons = configFile >> "CfgVehicles";
    		_backpacks = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getText(_cur_wep >> "vehicleClass");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_backpacks set[count _backpacks, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addBackPackCargo [_x,_packs]; } foreach _backpacks;
    	};
    	//Fill box with Guns & Ammo only
    	case 1:
    	{
    		_cfgweapons = configFile >> "CfgWeapons";
    		_weapons = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_weapons set[count _weapons, _classname];
    				};
    			};
    		};
    		
    		_cfgweapons = configFile >> "CfgMagazines";
    		_magazines = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				//_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
    				{
    					_magazines set[count _magazines, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addWeaponCargo [_x,_weps]; } foreach _weapons;
    		{ _boxn addMagazineCargo [_x,_mags]; }foreach _magazines;
    	};
    	
    	//Items only
    	case 2:
    	{	
    		_cfgweapons = configFile >> "CfgWeapons";
    		_items = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getNumber(_cur_wep >> "type");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    				if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_items set[count _items, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addItemCargo [_x,_items]; } foreach _items;
    	};
    	
    	case 3:
    	{
     
    		_cfgweapons = configFile >> "CfgVehicles";
    		_backpacks = [];
    		
    		for "_i" from 0 to (count _cfgWeapons)-1 do
    		{
    			_cur_wep = _cfgweapons select _i;
    			
    			if(isClass _cur_wep) then
    			{
    				_classname = configName _cur_wep;
    				_wep_type = getText(_cur_wep >> "vehicleClass");
    				_scope = getNumber(_cur_wep >> "scope");
    				_picture = getText(_cur_wep >> "picture");
    				if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
    				{
    					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
    					_backpacks set[count _backpacks, _classname];
    				};
    			};
    		};
    		
    		{ _boxn addBackPackCargo [_x,_packs]; } foreach _backpacks;
    	};
    };
     
    if(_resupply) then
    {
    	sleep _resupply_time;
    	execVM "scripts\fillCrate.sqf";
    };