// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// internal license name and which side may buy it, its name and its price
XY_licenses = [
    ["license_cop_air",             "cop", "Pilotenschein",                  -1         ],
    ["license_cop_air_small",       "cop", "kl. Pilotenschein",              -1         ],
    ["license_cop_cg",              "cop", "Bootsschein",                    -1         ],
    ["license_cop_sniper",          "cop", "Scharfschütze",                  -1         ],
    ["license_cop_board",           "cop", "Polizeirat",                     -1         ],
    ["license_cop_trainer",         "cop", "Ausbilder",                      -1         ],

    ["license_med_air",             "med", "Pilotenschein",                  -1         ],
    ["license_med_trainer",         "med", "Ausbilder",                      -1         ],

    ["license_thw_air",             "thw", "Pilotenschein",                  -1         ],
    ["license_thw_trainer",         "thw", "Ausbilder",                      -1         ],

    ["license_civ_driver",          "civ", "Führerschein",                   1000       ],
    ["license_civ_air",             "civ", "Pilotenschein",                  150000     ],
    ["license_civ_boat",            "civ", "Bootsschein",                    10000      ],
    ["license_civ_dive",            "civ", "Tauchschein",                    25000      ],
    ["license_civ_truck",           "civ", "LKW-Führerschein",               50000      ],
    ["license_civ_gun",             "civ", "Waffenschein",                   250000     ],
    ["license_civ_home",            "civ", "Hausbesitzurkunde",              15000000   ],
    ["license_civ_lawyer",          "civ", "Anwaltslizenz",                  1500000    ]
];

// Trainings (Resource processing, used to prevent information leaking to cops)
XY_training = [

    ["license_civ_barrel",          "civ", "Fassherstellung",               175000      ],
    ["license_civ_waterbarrel",     "civ", "Wasserabfüllgenehmigung",       175000      ],
    ["license_civ_oilbarrel",       "civ", "Ölabfüllgenehmigung",           175000      ],
    ["license_civ_bier",            "civ", "Bierverarbeitung",              85000       ],
    ["license_civ_cement",          "civ", "Zementverarbeitung",            85000       ],
    ["license_civ_cocaine",         "civ", "Kokainverarbeitung",            300000      ],
    ["license_civ_copper",          "civ", "Kupferverarbeitung",            10000       ],
    ["license_civ_crocodile",       "civ", "Crocodileherstellung",          300000      ],
    ["license_civ_diamond",         "civ", "Diamantenschleifer",            125000      ],
    ["license_civ_grapes",          "civ", "Branntweinherstellung",         85000       ],
    ["license_civ_gold",            "civ", "Goldverarbeitung",              85000       ],
    ["license_civ_heroin",          "civ", "Heroinverarbeitung",            300000      ],
    ["license_civ_holz",            "civ", "Holzverarbeitung",              85000       ],
    ["license_civ_iron",            "civ", "Eisenverarbeitung",             25000       ],
    ["license_civ_jewelry",         "civ", "Schmuckherstellung",            175000      ],
    ["license_civ_lsd",             "civ", "LSD-Verarbeitung",              300000      ],
    ["license_civ_marijuana",       "civ", "Marihuanaverarbeitung",         300000      ],
    ["license_civ_meth",            "civ", "Meth-Koch",                     300000      ],
    ["license_civ_moonshine",       "civ", "Schwarzbranntherstellung",      300000      ],
    ["license_civ_rebel",           "civ", "Rebellenausbildung",            2000000     ],
    ["license_civ_oil",             "civ", "Rohölverarbeitung",             175000      ],
    ["license_civ_plastic",         "civ", "Plastikverwertung",             175000      ],
    ["license_civ_salt",            "civ", "Salzveredlung",                 85000       ],
    ["license_civ_sarin",           "civ", "Sarinherstellung",              300000      ],
    ["license_civ_silber",          "civ", "Silberverarbeitung",            85000       ],
    ["license_civ_trash",           "civ", "Mülltennung",                   175000      ],
    ["license_civ_trashp",          "civ", "Müllverpackung",                175000      ],
    ["license_civ_uran",            "civ", "Uranitverarbeitung",            175000      ],
    ["license_civ_uran2",           "civ", "Urananreicherung",              300000      ],
    ["license_civ_uran3",           "civ", "Plutoniumherstellung",          300000      ],
    ["license_civ_uran4",           "civ", "Kernbrennstoffherstellung",     175000      ]
];

// initialize
{
    missionNamespace setVariable[ _x select 0, false];
} forEach (XY_licenses + XY_training);