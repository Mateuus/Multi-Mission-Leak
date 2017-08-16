// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
// based on work by Tonic

// start cash
XY_CA = 100000;

// Paycheck for civs, other factions are configured in their init script
XY_PC = 3000;

// z-inventory size
// start value, increases with clothing, both values need to be equal
XY_maxWeightBase = 60;
XY_maxWeightCurrent = 60;

// time between paychecks (minutes)
XY_PC_period = 5;

// respawn time (minutes)
XY_respawnTimer = 2;

// gang prices
// gang creation
XY_gangPrice = 800000;
// base price for extension (costs per target slot, after upgrade)
XY_gangUpgradeBase = 100000;
// configure DP missions
XY_DPlist = [];
for[ {_i = 1}, {_i <= 25}, {_i = _i + 1} ] do {
    XY_DPlist pushBack format["dp_%1", _i];
};

// Kupferkarpfen: Central price configuration for general store
XY_genStore = [
    ["Binocular", nil, 500],
    ["ItemGPS", nil, 500],
    ["ItemMap", nil, 150],
    ["ItemWatch", nil, 100],
    ["ToolKit", nil, 5000],
    ["FirstAidKit", nil, 500],
    ["NVGoggles_INDEP", nil, 5000]
];

// TAXISTATIONEN
XY_taxiStations = [

    ["taxi_spawn_kavala",   "Kavala", independent],
    ["taxi_spawn_athira",   "Athira", independent],
    ["taxi_spawn_pyrgos",   "Pyrgos", independent],
    ["taxi_spawn_sofia",    "Sofia", independent],

    ["taxi_spawn_kavala",   "Kavala", east],
    ["taxi_spawn_athira",   "Athira", east],
    ["taxi_spawn_pyrgos",   "Pyrgos", east],
    ["taxi_spawn_sofia",    "Sofia", east],

    ["taxi_spawn_kavalap",  "Kavala", west],
    ["taxi_spawn_athirap",  "Athira", west],
    ["taxi_spawn_pyrgosp",  "Pyrgos", west],
    ["taxi_spawn_sofiap",   "HW Patrol", west]
];

XY_placeableItems = [

// <LVL>, <NAME>, <CLASS>
    [ 1, "Pylon",              "RoadCone_L_F"                ],
    [ 2, "Sperre (klein)",     "Roadbarrier_small_F"         ],
    [ 2, "Sperre (groß)",      "RoadBarrier_F"               ],
    [ 3, "Beleuchtung",        "Land_PortableLight_single_F" ],
    [ 3, "Warnschild",         "SignAd_Sponsor_F"            ],
    [ 4, "Betonsperre",        "Land_CncBarrier_stripes_F"   ],
    [ 4, "Absperrband",        "TapeSign_F"                  ],
    [ 4, "Leitplanke",         "Land_Crash_barrier_F"        ],
    [ 5, "Betonsperre (lang)", "Land_CncBarrierMedium4_F"    ],
    [ 5, "Schranke",           "Land_BarGate_F"              ],
    [ 6, "Pfeile (links)",     "ArrowDesk_L_F"               ],
    [ 6, "Pfeile (rechts)",    "ArrowDesk_R_F"               ],
    [ 7, "Blitzer",            "Land_Runway_PAPI"            ]
];

// Fun animations
XY_funAnimations = [
    "AmovPercMstpSnonWnonDnon_exercisekneeBendA",
    "AmovPercMstpSnonWnonDnon_exercisekneeBendB",
    "AmovPercMstpSnonWnonDnon_exercisePushup",
    "AmovPercMstpSnonWnonDnon_exerciseKata",
    "AmovPercMstpSnonWnonDnon_Scared"
];