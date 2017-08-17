private ["_MoneyTransporter","_pos","_object","_gridPos","_cargo","_veh"];

_args = _this select 0; //[["moneyTransport"],[player]];
_event = _args select 0; // Eventname
_player = _args select 1; // player Obj

_pos = getPos _player; // Spawn position
_MoneyTransporter = "I_MRAP_03_F"; // Class of Transporter

_veh = _MoneyTransporter createVehicle _pos; // create it

_veh setMass 12000; // Mass Phys Test

//_veh setObjectTextureGlobal [0, "mpmissions\__CUR_MP.altis\core\textures\hunter\cop_sec_hunter.jpg"]; // Retexture
_veh setObjectTextureGlobal [0,'#(argb,8,8,3)color(0,0.5,0.8,0.2)'];

// Altis RPG Features
_veh setVariable["trunk_in_use",false,true];
_veh setVariable["vehicle_info_owners",[["1","Bank of Altis"]],true]; // Search and Anti Cheat

// Cargo Box
_moneyBox = "Land_CargoBox_V1_F" createVehicle position _veh;
_moneyBox attachTo [_veh,[0,-3.7,0]]; 

spawnTransporterMoney =
{
_killed = _this select 0; // the Transporter

 _fire = createVehicle ["test_EmptyObjectForFireBig",position _killed, [], 0, "NONE"]; // add Fire
 sleep 1;
 _smoke = createVehicle ["test_EmptyObjectForSmoke",position _killed, [], 0, "NONE"]; // add Smoke
   
	_posMoney = position _killed;
	_i = 1;
	// Create wad of cash
	for "_i" from 1 to 50 do 
	{
	_value1 = 15000 + (round random 20000);
	_item = "lhm_cash";
	_obj = "Land_Money_F" createVehicle _posMoney;
	_obj setVariable["item",["money",_value1],true];
	//[[_obj],"lhm_fnc_simDisable",nil,true] call lhm_fnc_mp;
	sleep 15;
	};
	
	// Create Money Bags
	_i = 1;
	for "_i" from 1 to 6 do 
	{
	//_value2 = 25000 + (round random 100000); // min 25k each 
	_item = "lhm_cash";
	_obj = "Land_Sack_F" createVehicle _posMoney;
	//_obj setVariable["item",["money",_value2],true];
	[[_obj],"lhm_fnc_simDisable",nil,true] call lhm_fnc_mp;
	sleep 5;
	};
};

// if vehicle is dead spawn some money
 _veh addMPEventHandler ["mpkilled",
 {
 _killed = _this select 0;
 _killer = _this select 1;
 _gridPos = mapGridPosition _killed;
 
 [_killed] spawn spawnTransporterMoney;

	_mtmarkername = format["mt_%1",_gridPos];
	_mtmarkertext = format["Money Transporter %1",_gridPos];      
	
	MTMarker = createMarker [_mtmarkername, getPos _killed];
	MTMarker setMarkerShape "ICON";
	MTMarker setMarkerType "hd_warning";
	MTMarker setMarkerColor "ColorRed";
	MTMarker setMarkerText _mtmarkertext;
	
 }
];
 
// Checks if Vehicle is alive
while {alive _veh} do {
If (!alive _veh) then {
detach _moneyBox;
};
sleep 1;
};