#include "cfg_functions.hpp"
#include "cfg_debriefing.hpp"
#include "cfg_dialogs.hpp"
#include "cfg_displays.hpp"
#include "cfg_notification.hpp"
#include "cfg_sounds.hpp"
#include "cfg_fuelstationSys.hpp"
#include "cfg_vehicleShop.hpp"
#include "cfg_vehicleSpawn.hpp"
#include "cfg_vehicles.hpp"
#include "cfg_vehicleColor.hpp"
#include "cfg_ausweis.hpp"
#include "cfg_housing.hpp"

class Cfgmaster
{
	paycheckPeriode = 5;
	respawntime = 3;
	
	dpSpots[] = 
	{
		"dp_1",
		"dp_2",
		"dp_3",
		"dp_4",
		"dp_5",
		"dp_6",
		"dp_7",
		"dp_8",
		"dp_9",
		"dp_10",
		"dp_11",
		"dp_12",
		"dp_13",
		"dp_14",
		"dp_15",
		"dp_15",
		"dp_16",
		"dp_17",
		"dp_18",
		"dp_19",
		"dp_20",
		"dp_21",
		"dp_22",
		"dp_23",
		"dp_24",
		"dp_25",
		"dp_26",
		"dp_27",
		"dp_28",
		"dp_29",
		"dp_30"
	};
	
	illigalItems[] = 
	{
		{"diesel_gestreckt",3500},
		{"joints",40000},
		{"casanovil",20000},
		{"hypromellose",4500},
		{"sildenafil",2000},
		{"spikeStrip",500},
		{"viagra",95000},
		{"mauer",500},
		{"kegel",500},
		{"heroinu",3000},
		{"heroinp",5000},
		{"cocaine",3000},
		{"cocainep",5000},
		{"marijuana",5000},
		{"cannabis",3000},
		{"turtle",9000},
		{"blastingcharge",10000},
		{"goldbar",60000},
		{"boltcutter",500},
		{"moonshine",9000},
		{"bottledshine",8000},
		{"mash",5000},
		{"flush",35000}
	};
	
	class eat
	{
		salema = 40;
		ornate = 20;
		mackerel = 20;
		tuna = 100;
		mullet = 30;
		catShark = 60;
		turtlesoup = 62;
		donuts = 30;
		apple = 10;
		pear = 10;
		banana = 10;
		cherry = 10;
		lemon = 10;
		rabbit = 20;
		turtle = 100;
		tbacon = 40;
		peach = 10;
	};
	
	paintballpos[] = 
	{
		{22931.928, 16803.957, 0.00010108948},
		{22933.08, 16764.197, -5.1259995e-005},
		{22926.154, 16779.051, 0.00019264221},
		{22897.955, 16776.057, 8.1062317e-006},
		{22897.912, 16765.873, 6.1988831e-006},
		{22896.092, 16800.832, 1.3828278e-005},
		{22868.729, 16796.09, 6.6757202e-005},
		{22865.416, 16768.547, -0.0001513958},
		{22856.795, 16773, 1.8596649e-005},
		{22909.215, 16796.012, 1.3828278e-005},
		{22889.168, 16801.854, -0.0001168251},
		{22914.471, 16784.188, 8.2492828e-005},
		{22925.969, 16801.676, 1.2397766e-005},
		{22876.914, 16768.236, 0.00028181076},
		{22858.531, 16804.084, 0},
		{22876.395, 16785.689, -0.00022554398}
	};
};