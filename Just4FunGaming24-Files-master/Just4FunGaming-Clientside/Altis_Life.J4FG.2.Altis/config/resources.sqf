// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// Single configuration for resource zones to prevent copy/paste fuckups
XY_resourceZones = [
    // <--              Zone Names                 -->    <Product>       <Amount> <utility>
    [ ["resource_legal_apple_1", 
       "resource_legal_apple_2", 
       "resource_legal_apple_3", 
       "resource_legal_apple_4"],            "apple",          3,       "" ],
    [ ["resource_legal_peaches_1", 
       "resource_legal_peaches_2", 
       "resource_legal_peaches_3", 
       "resource_legal_peaches_4"],          "peach",          3,       "" ],
    [ ["resource_legal_grape_1", 
       "resource_legal_grape_2"],            "grapes",         3,       "" ],
    [ ["resource_illegal_heroin"],           "heroinu",        2,       "" ],
    [ ["resource_illegal_cocaine"],          "cocaine",        2,       "" ],
    [ ["resource_illegal_weed"],             "cannabis",       2,       "" ],
    [ ["resource_illegal_meth"],             "methu",          2,       "" ],
    [ ["resource_illegal_frogs"],            "frogs",          2,       "" ],
    [ ["resource_legal_holz"],               "holzu",          3,       "" ],
    [ ["resource_legal_oilwaste"],           "oilu",           2,       "" ],
    [ ["resource_legal_bier"],               "hopfen",         2,       "" ],
    [ ["processor_illegal_moonshine"],       "propanol",       3,       "" ],
    [ ["resource_illegal_bweapon"],          "bweapon",        1,       "" ],

    [ ["resource_legal_copper"],             "copperore",      3,       "pickaxe" ],
    [ ["resource_legal_iron"],               "ironore",        3,       "pickaxe" ],
    [ ["resource_legal_salt"],               "salt",           3,       "pickaxe" ],
    [ ["resource_legal_diamond"],            "diamond",        2,       "pickaxe" ],
    [ ["resource_legal_rock"],               "rock",           2,       "pickaxe" ],
    [ ["resource_legal_uran"],               "uranu",          1,       "pickaxe" ],
    [ ["resource_legal_silber"],             "silberu",        2,       "pickaxe" ],
    [ ["resource_legal_gold"],               "goldu",          2,       "pickaxe" ],
    [ ["resource_legal_trash"],              "trash",          2,       "" ],
    [ ["resource_legal_plastic_1",
       "resource_legal_plastic_2",
       "resource_legal_plastic_3"],          "plastic",        2,       "" ]

];

// Kupferkarpfen: Single configuration for resource processing to prevent copy/paste fuckups
XY_resourceProcessors = [
    // <Name>         <Source(s)>                      <Target>,   <Duration>, <Amount>, <Condition> <Progress-Text>
    [ "turtle",       ["turtle"],                       "turtle",      30, -1, { true }, "ERROR: If you see this, call an admin" ], // << Workaround to retrieve source resource for turtles
    [ "oil",          ["oilbarrel"],                    "oilp",        25, -1, { true }, "Rohöl raffinieren" ],
    [ "diamond",      ["diamond"],                      "diamondc",    35, -1, { true }, "Diamanten schleifen" ],
    [ "copper",       ["copperore"],                    "copper_r",    25, -1, { true }, "Kupfer einschmelzen" ],
    [ "iron",         ["ironore"],                      "iron_r",      25, -1, { true }, "Eisen einschmelzen" ],
    [ "salt",         ["salt"],                         "salt_r",      25, -1, { true }, "Salz auswaschen" ],
    [ "cement",       ["rock"],                         "cement",      25, -1, { true }, "Zement herstellen" ],
    [ "grapes",       ["grapes"],                       "brandy",      25, -1, { true }, "Weinbrand herstellen" ],
    [ "gold",         ["goldu"],                        "goldp",       25, -1, { true }, "Goldbarren gießen" ],
    [ "silber",       ["silberu"],                      "silberp",     25, -1, { true }, "Silberbarren gießen" ],
    [ "holz",         ["holzu"],                        "holzp",       25, -1, { true }, "Bretter sägen" ],
    [ "bier",         ["hopfen"],                       "bottledbeer", 25, -1, { true }, "Bier brauen" ],
    [ "heroin",       ["heroinu"],                      "heroinp",     40, -1, { true }, "Heroin synthetisieren" ],
    [ "cocaine",      ["cocaine"],                      "cocainep",    40, -1, { true }, "Kokain herstellen" ],
    [ "marijuana",    ["cannabis"],                     "marijuana",   40, -1, { true }, "Marihuana herstellen" ],
    [ "lsd",          ["frogs"],                        "frogslsd",    40, -1, { true }, "Verarbeitet Mutterkornpilz zu LSD" ],
    [ "meth",         ["methu"],                        "methp",       40, -1, { true }, "Koche Crystal-Meth" ],
    [ "moonshine",    ["grapes"],                       "moonshine",   40, -1, { true }, "Schwarzbrand destillieren" ],
    [ "uran",         ["uranu"],                        "uranu2",      40, -1, { true }, "Uran auswaschen" ],
    [ "uran2",        ["uranu2"],                       "uranp",       50, -1, { true }, "Uran anreichern" ],
    [ "uran3",        ["uranp"],                        "uranp2",      90, -1, { true }, "Plutonium erbrüten" ],
    [ "uran4",        ["uranu2"],                       "uranp3",      50, -1, { true }, "Kernbrennstoff herstellen" ],
    [ "sarin",        ["bweapon", "propanol"],          "sarin",       40, -1, { true }, "Sarin mischen" ],
    [ "jewelry",      ["goldp", "diamondc"],            "jewelry",     40, -1, { true }, "Schmuck herstellen" ],
    [ "barrel",       ["iron_r", "copper_r"],           "barrel",      40, -1, { true }, "Fässer herstellen" ],
    [ "waterbarrel",  ["barrel"],                       "waterbarrel", 40, -1, { true }, "Fässer befüllen" ],
    [ "oilbarrel",    ["waterbarrel", "barrel"],        "oilbarrel",   40, -1, { true }, "Fässer befüllen" ],
    [ "crocodile",    ["heroinp", "oilu", "propanol"],  "crocodile",   40, -1, { true }, "Crocodile herstellen" ],
    [ "trash",        ["trash"],                        "waste",       50, -1, { true }, "Müll trennen" ],
    [ "plastic",      ["plastic"],                      "trashbag",    50, -1, { true }, "Plastik verarbeiten" ],
    [ "trashp",       ["waste", "trashbag"],            "trashp",      40, -1, { true }, "Müll verpacken" ],
    [ "usb1",         ["usbstick_1"],                   "usbstick_2",  3,   1, { if( (missionNamespace getVariable [format["%1hackbook", XY_ssv_mniPrefix], 0]) <= 0 ) exitWith { hint "Du brauchst ein HackBook Pro für den Download!"; false }; true }, "Downloading" ],
    [ "usb2",         ["usbstick_2"],                   "usbstick_3",  5,   1, { if( (missionNamespace getVariable [format["%1hackbook", XY_ssv_mniPrefix], 0]) <= 0 ) exitWith { hint "Du brauchst ein HackBook Pro zum Entschlüsseln!"; false }; true }, "Decrypting" ]
];