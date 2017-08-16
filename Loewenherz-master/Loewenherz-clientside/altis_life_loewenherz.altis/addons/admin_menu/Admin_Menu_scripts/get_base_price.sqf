






private ["_config","_objects","_price","_found","_priceGET","_count","_where","_tempPrice"];
_config = [
	["Land_spp_Mirror_F", 400000],
	["Land_cargo_addon02_V2_F", 300000],
	["Land_CashDesk_F", 1000000],
	["Land_i_Addon_03_V1_F", 1250000],
	["Land_Metal_wooden_rack_F", 1500000],
	["Land_i_Addon_02_V1_F", 2000000],
	["Land_Atm_01_F", 2500000],
	["Land_Medevac_HQ_V1_F", 5000000],
	["Land_Cargo_House_V1_F", 6000000],
	["Land_ShelvesMetal_F", 7000000],
	["Land_i_Garage_V1_F", 10000000],
	["Land_fs_feed_F", 3000000],
	["Land_TentHangar_V1_F", 12000000],
	["Land_FuelStation_Feed_F", 6000000],
	["B_CargoNet_01_ammo_F", 15000000],
	["Target_PopUp_Moving_F", 100000],
	["Land_MarketShelter_F", 50000],
	["Land_Shed_Small_F", 350000],
	["Land_Sunshade_03_F", 75000],
	["Campfire_burning_F", 150000],
	["Land_ToiletBox_F", 200000],
	["Land_BagBunker_Tower_F", 1200000],
	["Land_BagBunker_Small_F", 900000],
	["Land_Cargo_Patrol_V2_F", 2000000],
	["Land_BarGate_F", 50000],
	["Land_HBarrierBig_F", 135000],
	["Land_Stone_Gate_F", 120000],
	["Land_Wall_IndCnc_4_F", 80000],
	["Land_Wall_Tin_4_2", 70000],
	["Land_City_Gate_F", 120000],
	["Land_City2_8m_F", 80000],
	["Land_RampConcrete_F",250000],
	["Land_Mil_WiredFence_F",40000],
	["Land_Mil_WiredFence_Gate_F",80000],
	["Land_PipeWall_concretel_8m_F",40000],
	["MetalBarrel_burning_F", 50000],
	["Land_LampShabby_F", 50000],
	["Land_LampHalogen_F", 50000],
	["Land_LampStreet_small_F", 50000]

];

_objects = [];
_price = [];


{
	_objects pushback (_x select 0);
	_price pushback (_x select 1);

} foreach _config;


_found = NEARESTOBJECTS[PLAYER,["all"],200];

_priceGET = 0;
_count = 0;
_tempPrice = 0;
{
	if((typeOf _x ) in _objects) then {
		_where = _objects find (typeOf _x);
		if(_where != -1) then {
			_tempPrice = _price select _where;
			_priceGET = _priceGET + _tempPrice;
			_count = _count + 1;
		};
	};


} foreach _found;
if(_count == 0) exitWith {hint "Es wurden keine Baseobjekte in der Nähe gefunden!";};

hint format["Anzahl Objekte: \n %1  \n \n Gesamtpreis:\n %2",_count,_priceGET];



