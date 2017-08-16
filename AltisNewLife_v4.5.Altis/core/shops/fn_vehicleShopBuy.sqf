#include <macro.h>
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_frais","_prixcb","_gangbank","_cash","_secure","_sp","_vh","_box","_offset"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint "Vous n'avez pas selectionné de véhicule !"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];
//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint "Vous n'avez pas le permis requis !"};
_frais = _basePrice * 0.05; //5% de frais bancaire
_prixcb = _basePrice + _frais;
_cash = 0;
_secure = 0;
_gangbank = (grpPlayer GVAR "gang_bank");
if(isNil "_gangbank") then {_gangbank = 0;};
if((life_inv_cb == 0) && (argent_liquide < _basePrice)) exitWith {hint "Vous n'avez pas assez de liquide et pas de carte bleue !"};
_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};
if(_spawnPoint == "") exitWith {hint "Il y a actuellement un véhicule qui bloque !"};
if((_gangbank >= _prixcb) && (GETC(life_reblevel) > 0) && (life_inv_cb > 0)) then {
		_action = [
			format["ARGENT DE LA FAMILLE : <t color='#8cff9b'>%1€</t><br/>COMPTE BANCAIRE : <t color='#8cff9b'>%5€</t><br/>ARGENT LIQUIDE : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix Carte : <t color='#8cff9b'>%4€</t>",
				[(grpPlayer GVAR "gang_bank")] call life_fnc_numberText,
				[argent_liquide] call life_fnc_numberText,
				[_basePrice] call life_fnc_numberText,
				[_prixcb] call life_fnc_numberText,
				[compte_banque] call life_fnc_numberText
			],
    "Acheter avec le compte de la famille ?",
    "Oui",
    "Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			_owner = (grpPlayer GVAR "gang_owner");
            [[0,format["Un vehicule %1 a été acheté par %3 pour %2€ sur le compte du gang",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_prixcb] call life_fnc_numberText,name player]],"life_fnc_broadcast",_owner,false] spawn life_fnc_MP;
			_funds = grpPlayer GVAR "gang_bank";
			_funds = _funds - _prixcb;
			grpPlayer SVAR["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
			_secure = 1;			
		} else {
				_action = [format["COMPTE BANCAIRE : <t color='#8cff9b'>%1€</t><br/>ARGENT LIQUIDE : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix Carte : <t color='#8cff9b'>%4€</t>",
					[compte_banque] call life_fnc_numberText,
					[argent_liquide] call life_fnc_numberText,
					[_baseprice] call life_fnc_numberText,
					[_prixcb] call life_fnc_numberText
				],
					"Choisissez votre moyen de paiement",
					"Carte Bleue",
					"Cash"
				]   call BIS_fnc_guiMessage;
			if(_action) then {
					if(_prixcb > compte_banque) exitWith {hint "Vous n'avez pas assez d'argent sur votre compte !"};
					compte_banque = compte_banque - _prixcb;
				    _secure = 1;					
			} else {
					if(_basePrice > argent_liquide) exitWith {hint "Vous n'avez pas assez d'argent sur vous !"};
					if(argent_liquide >= _basePrice) then {
					argent_liquide = argent_liquide - _basePrice;
					_cash = 1;
				    _secure = 1;					
					};
		};
	};
} else {
        if((life_inv_cb == 0)) then {
				argent_liquide = argent_liquide - _basePrice;
		        _cash = 1;
				_secure = 1;				
		} else {
				_action = [format["COMPTE BANCAIRE : <t color='#8cff9b'>%1€</t><br/>ARGENT LIQUIDE : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix Carte : <t color='#8cff9b'>%4€</t>",
					[compte_banque] call life_fnc_numberText,
					[argent_liquide] call life_fnc_numberText,
					[_basePrice] call life_fnc_numberText,
					[_prixcb] call life_fnc_numberText
					],
					"Choisissez votre moyen de paiement",
					"Carte Bleue",
					"Cash"
					] call BIS_fnc_guiMessage;
			if(_action) then {
					if(_prixcb > compte_banque) exitWith {hint "Vous n'avez pas assez d'argent sur votre compte !"};
					compte_banque = compte_banque - _prixcb;
				    _secure = 1;					
			} else {
					if(_basePrice > argent_liquide) exitWith {hint "Vous n'avez pas assez d'argent sur vous !"};
					if(argent_liquide >= _basePrice) then {
					argent_liquide = argent_liquide - _basePrice;
					_cash = 1;
				    _secure = 1;					
					};
			};
};
};
if(_secure == 1) then {	

	if(_cash == 1) then {
		hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€</t>",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
	} else {
		hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€ + %3€</t> de frais bancaire",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText,[_frais] call life_fnc_numberText];
	};
						
//hint format["Vous avez acheté un %1 pour %2$",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	//systemChat "Tickle";	
		_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	if (!isNil _hs) then {
		_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false;	
		_vehicle setPosATL (_hs modelToWorld [-0.4,-4,14]);
		_vehicle lock 2;
	} else {
		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
	};
	
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle SVAR["trunk_in_use",false,true];
	_vehicle SVAR["vehicle_info_owners",[[steamid,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	
	
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle SVAR["trunk_in_use",false,true];
	_vehicle SVAR["vehicle_info_owners",[[steamid,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

//[_vehicle] spawn
//{
//_vehicle = (_this select 0);
//Sleep 2;
//_vehicle allowDamage true;
//};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};
	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
		[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if((life_veh_shop select 2) == "civ" && {_className == "B_Truck_01_mover_F"}) then {
		[_vehicle,"dep_offroad",true] spawn life_fnc_vehicleAnimate;
		};
		if((life_veh_shop select 2) == "civ" && {_className == "B_G_Offroad_01_repair_F"}) then {
		[_vehicle,"dep_offroad",true] spawn life_fnc_vehicleAnimate;
		};
	};
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};
_vehicle allowDamage true;
life_vehicles pushBack _vehicle;
[[steamid,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

if(_mode) then {
	if(!(_className in [""])) then {
		[[(steamid),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};

_box = boundingBox _vehicle;  
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...

_sp = visiblePosition _vehicle;
_sp = _sp vectorAdd [0,0,_offset]; 
_vh = createVehicle ["Sign_Arrow_Large_F", _sp ,[],0,"NONE"];
_vh setPos _sp; 

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
uiSleep 10;
deleteVehicle _vh;

} else {
			hint "Vous n'avez pas assez de liquide sur vous !";
			false;
};