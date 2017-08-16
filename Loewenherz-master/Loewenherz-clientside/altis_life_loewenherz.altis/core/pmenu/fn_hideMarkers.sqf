

private ["_marker_sequenz","_was","_farming_Markers","_illegal_Farming_Markers","_legal_Farming_Markers","_polizei_Marker","_medic_Marker","_legende","_gang_Markers","_info_Markers","_alle_Shops","_illegale_Shops","_legale_shops","_security_Markers","_sonsitge_Marker","_tankstellen_Marker","_garagen_Marker","_dp_Missions_Markers","_lizenzen_Shop_Markers","_atm_Markers","_chopchop_Markers","_grenz_Marker","_ret","_All_farming_Markers","_Illegal_farming_Markers","_Legal_farming_Markers","_police_Markers","_medic_Markers","_basebuild","_basebuild_markers","_Gang_Markers","_tankstellen_Markers","_alle_shops","_illegal_shops","_legal_shops","_LSA_Markers","_sonstige_marker","_DP_Marker","_Lizenzen_shops","_atm_markers","_chopChops","_Legende","_info"];

_marker_sequenz = param[0,"",[""]];
_was = param[1,"",[""]];


if(_was == "")exitWith {};
if(_marker_sequenz == "")exitWith {};


_farming_Markers =
[
	"Dealer_1_3",
	"wood",
	"heroin_p",
	"apple_2",
	"oil_trader_1_1",
	"salt_1",
	"Mr.Moonshine",
	"Salt",
	"copper_mine_1_1",
	"iron_1",
	"rock_proc",
	"heroin_1",
	"heroin_area",
	"Kokain Verarbeiter",
	"Weed_p_1",
	"oil_trader_2",
	"oil_trader_1",
	"oil_trader_3_1",
	"turle_dealer_2",
	"oil_trader_3_1_1",
	"uran_1",
	"uran",
	"turtle_1_name",
	"turtle_1",
	"uran2",
	"Oil_rig",
	"uran_2",
	"weed_1",
	"Brennerei",
	"Alk Ankauf",
	"rye_n_1",
	"rye_1",
	"Bottler",
	"hops_1",
	"hops_n_1",
	"Brauerei",
	"yeast_1",
	"yeast_n_1",
	"cocaine_1",
	"coke_area",
	"peaches_3",
	"diamond_1",
	"dimond_1",
	"Dealer_1_4",
	"oil_1",
	"tabak_processing",
	"oil_trader",
	"zigaretten_trader",
	"peaches_1",
	"apple_4",
	"iron_processing",
	"copper_mine_1",
	"oil_2",
	"tabak_1",
	"turle_dealer",
	"turtle_1_name_1",
	"turtle_2",
	"apple_1",
	"Dealer_1",
	"Drinks",
	"peaches_2",
	"turle_dealer_1",
	"oil_trader_3",
	"oil_trader_4",
	"turtle_1_name_2",
	"turtle_3",
	"OilP",
	"dimond_1_1",
	"rock_1",
	"sand_1",
	"Fisch_market_1",
	"Fisch_market_2",
	"lead_1"
];

_illegal_Farming_Markers =
[
	"turtle_1_name_2",
	"turtle_3",
	"turle_dealer_1",
	"Dealer_1",
	"turtle_1_name_1",
	"turtle_2",
	"turle_dealer",
	"uran2",
	"turtle_1",
	"turtle_1_name",
	"weed_1",
	"uran_2",
	"uran_1",
	"uran",
	"turle_dealer_2",
	"Weed_p_1",
	"heroin_1",
	"heroin_area",
	"cocaine_1",
	"coke_area",
	"Dealer_1_4",
	"Kokain Verarbeiter",
	"Mr.Moonshine",
	"heroin_p",
	"Dealer_1_3"
];

_legal_Farming_Markers =
[
	"wood",
	"apple_2",
	"Fisch_market_2",
	"oil_trader_1_1",
	"salt_1",
	"Salt",
	"copper_mine_1_1",
	"iron_1",
	"rock_proc",
	"oil_trader_2",
	"oil_trader_1",
	"oil_trader_3_1",
	"oil_trader_3_1_1",
	"Oil_rig",
	"Brennerei",
	"Alk Ankauf",
	"rye_n_1",
	"rye_1",
	"Bottler",
	"hops_1",
	"hops_n_1",
	"Brauerei",
	"yeast_1",
	"yeast_n_1",
	"peaches_3",
	"diamond_1",
	"dimond_1",
	"oil_1",
	"tabak_processing",
	"oil_trader",
	"zigaretten_trader",
	"peaches_1",
	"apple_4",
	"iron_processing",
	"copper_mine_1",
	"oil_2",
	"tabak_1",
	"apple_1",
	"Drinks",
	"peaches_2",
	"oil_trader_3",
	"oil_trader_4",
	"OilP",
	"dimond_1_1",
	"rock_1",
	"sand_1",
	"Fisch_market_1",
	"lead_1"
];

_polizei_Marker =
[
	"police_hq_1",
	"police_hq_1_1",
	"cop_spawn_4",
	"Correctional Facility",
	"cop_spawn_3",
	"cop_spawn_5",
	"cop_spawn_5_1",
	"police_hq_2",
	"cop_spawn_7",
	"coastguard",
	"Police HQ_1"
];

_medic_Marker =
[
	"hospital_marker",
	"turle_dealer_1_1",
	"hospital_marker_1_1",
	"hospital_2",
	"hospital_3",
	"hospital_marker_1"
];

_legende =
[
	"chop_shop_3_1",
	"Carshop_1",
	"truck_1_1",
	"boat_1_1",
	"Gen_1_1",
	"Hospital_1_1",
	"atm_1",
	"Traderexample"
];

_gang_Markers =
[
	"gang_area_2",
	"gang_area_1",
	"gang_area_3",
	"Area_Marker_Text_1",
	"Area_Marker_1"
];

_info_Markers =
[
	"LH",
	"TS3",
	"TS3_1",
	"DonateInfo",
	"Author"
];

_alle_Shops =
[
	"civ_truck_shop1_2",
	"boat_2",
	"civ_ship_1",
	"dive_shop",
	"Gen_3_1_2",
	"Gen_5",
	"cig_1",
	"VehicleSpawnZone",
	"car1_1_1",
	"Gen_3_2",
	"bounty_hunter_1",
	"gun_store_1_1",
	"civ_truck_shop1_1_1",
	"cig_1_1",
	"Gen_3_1_1",
	"cig_1_3",
	"Rebelop_2_1",
	"gun_store_1",
	"civ_truck_shop1",
	"Gen_3_2_1",
	"Gen_3_1_2_1",
	"Gen_5_1",
	"dive_shop_1",
	"cig_1_2_1",
	"car1_1_1_1",
	"VehicleSpawnZone_1",
	"dive_shop_2",
	"boat_2_1",
	"civ_ship_2",
	"kart_shop_text_1_1",
	"cig_1_5",
	"airshop",
	"Gen_3_4_1",
	"Gen_4",
	"cig_1_4",
	"car1_2_1_1",
	"Gen_3_1_1_2",
	"bounty_hunter_2",
	"cig_1_6",
	"boat_2_1_1",
	"dive_shop_2_1",
	"civ_ship_3",
	"cig_1_7",
	"civ_truck_shop1_1",
	"Gen_2",
	"dive_shop_2_2",
	"cig_1_9",
	"Gen_3_1_1_3",
	"car1_2",
	"gun_store_1_1_1",
	"cig_1_11",
	"Rebelop_1",
	"gold_bar_dealer",
	"bounty_hunter",
	"Gen_3_1_1_1",
	"Gen_3_4",
	"cig_1_8",
	"Gen_2_1",
	"car1_1",
	"gun_store_1_1_2",
	"airshop_1",
	"cig_1_2",
	"Rebelop"
];

_illegale_Shops =
[
	"Rebelop",
	"Rebelop_2_1",
	"Rebelop_1"
];


_legale_shops =
[
	"civ_truck_shop1_2",
	"boat_2",
	"civ_ship_1",
	"dive_shop",
	"Gen_3_1_2",
	"Gen_5",
	"cig_1",
	"VehicleSpawnZone",
	"car1_1_1",
	"Gen_3_2",
	"bounty_hunter_1",
	"gun_store_1_1",
	"civ_truck_shop1_1_1",
	"cig_1_1",
	"Gen_3_1_1",
	"cig_1_3",
	"gun_store_1",
	"civ_truck_shop1",
	"Gen_3_2_1",
	"Gen_3_1_2_1",
	"Gen_5_1",
	"dive_shop_1",
	"cig_1_2_1",
	"car1_1_1_1",
	"VehicleSpawnZone_1",
	"dive_shop_2",
	"boat_2_1",
	"civ_ship_2",
	"kart_shop_text_1_1",
	"cig_1_5",
	"airshop",
	"Gen_3_4_1",
	"Gen_4",
	"cig_1_4",
	"car1_2_1_1",
	"Gen_3_1_1_2",
	"bounty_hunter_2",
	"cig_1_6",
	"boat_2_1_1",
	"dive_shop_2_1",
	"civ_ship_3",
	"cig_1_7",
	"civ_truck_shop1_1",
	"Gen_2",
	"dive_shop_2_2",
	"cig_1_9",
	"Gen_3_1_1_3",
	"car1_2",
	"gun_store_1_1_1",
	"cig_1_11",
	"gold_bar_dealer",
	"bounty_hunter",
	"Gen_3_1_1_1",
	"Gen_3_4",
	"cig_1_8",
	"Gen_2_1",
	"car1_1",
	"gun_store_1_1_2",
	"airshop_1",
	"cig_1_2",
	"dive_shop_2_3",
	"Gen_3_2_1_1"
];

_security_Markers =
[
	"Security Company_1",
	"Security Company"
];

_sonsitge_Marker =
[
	"civ_gar_1_1_1_1",
	"sky_diving",
	"pbarenainfo_1",
	"vehrepaint1",
	"vehrepaint1_1",
	"7News_1",
	"paintballarena",
	"civ_gar_1_1_1",
	"StartBankHeist",
	"fed_reserve",
	"air_serv_1",
	"casino1"
];


_tankstellen_Marker =
[

	"heli_fuel_1_1",
	"heli_fuel_1_3",
	"heli_fuel_1",
	"heli_fuel_1_2"
];
{
	_tankstellen_Marker pushBack format["GasMarker_%1",_x];

} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
_garagen_Marker =
[
	"civ_gar_1_5",
	"civ_gar_1_5_2",
	"civ_gar_1_1",
	"civ_gar_1_3",
	"reb_gar_1_1_1_2_1",
	"civ_gar_1_5_1",
	"civ_gar_1_4",
	"civ_gar_1_1_2",
	"civ_gar_1_2"
];


_dp_Missions_Markers =
[
	"dp_missions",
	"dp_1_18_1",
	"dp_1_18",
	"dp_1_20",
	"dp_1_18_2",
	"dp_1_19",
	"dp_1_9",
	"dp_1_17",
	"dp_1_3",
	"dp_1_1",
	"dp_1_16",
	"dp_1_21",
	"dp_1_2",
	"dp_1_6",
	"dp_1_7",
	"dp_1_14_1",
	"dp_1_14",
	"dp_1_15",
	"dp_1_13",
	"dp_1_8",
	"dp_1_11",
	"dp_1_10",
	"dp_1_4",
	"dp_1_5",
	"dp_1_15_1",
	"dp_1_12"
];

_lizenzen_Shop_Markers =
[
	"license_shop_3",
	"license_shop_4",
	"license_shop_1",
	"license_shop_2_1",
	"license_shop_2",
	"Alk_licenses"
];


_atm_Markers =
[
	"atm_marker_2_1",
	"atm_marker_4_1",
	"atm_marker_2_6",
	"atm_marker_1_3",
	"atm_marker_5",
	"atm_marker_2_2",
	"atm_marker_2_8",
	"atm_marker_1_2",
	"atm_marker_4",
	"atm_marker_2",
	"atm_marker_2_10",
	"atm_marker_2_7",
	"atm_marker_3",
	"atm_marker_2_4",
	"atm_marker_2_9",
	"atm_1_3_11_5_4",
	"atm_marker_1_1",
	"atm_marker_2_5",
	"atm_marker_2_3",
	"atm_marker_1",
	"atm_marker_4_2"
];

_chopchop_Markers =
[
	"chop_shop_5",
	"chop_shop_3",
	"chop_shop_4",
	"chop_shop_2"
];


_grenz_Marker =
[
	"RebelArea",
	"AltisBorder",
	"in_1_1_1_2_1",
	"in_2_1_1",
	"in_1_1_1_2",
	"in_1_1_1_1_1",
	"in_1_1_1_23",
	"in_1_1_1_1_1_1"
];

{
	_sonsitge_Marker pushBack _x;

} foreach _grenz_Marker;







_ret = [];

switch(true) do {
	case (_marker_sequenz == "_All_farming_Markers"): {_ret = _farming_Markers; };
	case (_marker_sequenz == "_Illegal_farming_Markers"): {_ret = _illegal_Farming_Markers; };
	case (_marker_sequenz == "_Legal_farming_Markers"): {_ret = _legal_Farming_Markers; };
	case (_marker_sequenz == "_police_Markers"): {_ret = _polizei_Marker; };
	case (_marker_sequenz == "_medic_Markers"): {_ret = _medic_Marker; };
	case (_marker_sequenz == "_basebuild"): {
		_basebuild_markers = allMapMarkers;
		_basebuild_markers = _basebuild_markers - _farming_Markers;
		_basebuild_markers = _basebuild_markers - _polizei_Marker;
		_basebuild_markers = _basebuild_markers - _medic_Marker;
		_basebuild_markers = _basebuild_markers - _gang_Markers;
		_basebuild_markers = _basebuild_markers - _tankstellen_Marker;
		_basebuild_markers = _basebuild_markers - _alle_Shops;
		_basebuild_markers = _basebuild_markers - _security_Markers;
		_basebuild_markers = _basebuild_markers - _sonsitge_Marker;
		_basebuild_markers = _basebuild_markers - _dp_Missions_Markers;
		_basebuild_markers = _basebuild_markers - _lizenzen_Shop_Markers;
		_basebuild_markers = _basebuild_markers - _atm_Markers;
		_basebuild_markers = _basebuild_markers - _chopchop_Markers;

		{
			if(_x select [0,17] == "ga_building_spawn") then {
				_ret pushBack _x;
			};
		} foreach _basebuild_markers;


	};
	case (_marker_sequenz == "_Gang_Markers"): {_ret = _gang_Markers; };
	case (_marker_sequenz == "_tankstellen_Markers"): {_ret = _tankstellen_Marker; };
	case (_marker_sequenz == "_alle_shops"): {_ret = _alle_Shops; };
	case (_marker_sequenz == "_illegal_shops"): {_ret = _illegale_Shops; };
	case (_marker_sequenz == "_legal_shops"): {_ret = _legale_shops; };
	case (_marker_sequenz == "_LSA_Markers"): {_ret = _security_Markers; };
	case (_marker_sequenz == "_sonstige_marker"): {_ret = _sonsitge_Marker; };
	case (_marker_sequenz == "_garagen_Marker"): {_ret = _garagen_Marker; };
	case (_marker_sequenz == "_DP_Marker"): {_ret = _dp_Missions_Markers; };
	case (_marker_sequenz == "_Lizenzen_shops"): {_ret = _lizenzen_Shop_Markers; };
	case (_marker_sequenz == "_atm_markers"): {_ret = _atm_Markers; };
	case (_marker_sequenz == "_chopChops"): {_ret = _chopchop_Markers; };
	default {_ret = [];};
};
/*
if(_marker_sequenz == "_All_farming_Markers") then {
	_ret = _farming_Markers;
};

if(_marker_sequenz == "_Illegal_farming_Markers") then {
	_ret = _illegal_Farming_Markers;
};

if(_marker_sequenz == "_Legal_farming_Markers") then {
	_ret = _legal_Farming_Markers;
};

if(_marker_sequenz == "_police_Markers") then {
	_ret = _polizei_Marker;
};

if(_marker_sequenz == "_medic_Markers") then {
	_ret = _medic_Marker;
};

if(_marker_sequenz == "_Legende") then {
	_ret = _legende;
};

if(_marker_sequenz == "_Gang_Markers") then {
	_ret = _gang_Markers;
};

if(_marker_sequenz == "_info") then {
	_ret = _info_Markers;
};

if(_marker_sequenz == "_alle_shops") then {
	_ret = _alle_Shops;
};

if(_marker_sequenz == "_illegal_shops") then {
	_ret = _illegale_Shops;
};

if(_marker_sequenz == "_legal_shops") then {
	_ret = _legale_shops;
};

if(_marker_sequenz == "_LSA_Markers") then {
	_ret = _security_Markers;
};

if(_marker_sequenz == "_sonstige_marker") then {
	_ret = _sonsitge_Marker;
};

if(_marker_sequenz == "_garagen_Marker") then {
	_ret = _garagen_Marker;
};

if(_marker_sequenz == "_DP_Marker") then {
	_ret = _dp_Missions_Markers;
};

if(_marker_sequenz == "_Lizenzen_shops") then {
	_ret = _lizenzen_Shop_Markers;
};

if(_marker_sequenz == "_atm_markers") then {
	_ret = _atm_Markers;
};

if(_marker_sequenz == "_chopChops") then {
	_ret = _chopchop_Markers;
};
*/


if(count(_ret)==0)exitWith{};


if(_was == "add") then {
	{
		_x setMarkerAlphaLocal 1;
	} foreach _ret;
};

if(_was == "remove") then {
	{
		_x setMarkerAlphaLocal 0;
	} foreach _ret;
};



