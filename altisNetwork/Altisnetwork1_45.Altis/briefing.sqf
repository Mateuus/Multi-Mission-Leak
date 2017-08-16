waitUntil {!isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["controls","Controls"];

    
// Controls Section

player createDiaryRecord ["controls",
    [
        "Police and medic controls",
        "
F: Vehicle siren.<br/>
L: Speed radar (police only and weapon is P07 Suppressed).<br/>
Left Shift + L: Activates siren lights.<br/>
Left Shift + R: Restrain (police only).<br/><br/>
        "
    ]
];

player createDiaryRecord ["controls",
    [
        "Civilian controls",
        "
Left Shift + G: Knock out / stun (Weapon required. Used for robbing).<br/>
Spacebar: Place storage container.<br/><br/>
        "
    ]
];
player createDiaryRecord ["controls",
    [
        "General controls",
        "
Y: Open Player Menu.<br/>
U: Lock and unlock vehicles and houses.<br/>
T: Vehicle trunk and house virtual item storage.<br/>
Left Shift + B: Surrender (hands on head).<br/>
Left Windows: Main interaction key. Used for interacting with objects like vehicles, houses, ATMs, and restrained players. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10.<br/>
Left Shift + H: Holsters the weapon in your hands.<br/>
Left Ctrl + H: Revert holster action.<br/>
Shift + Spacebar: Jump.<br/>
Left Shift + O: (un)fade sound (ear plugs).<br/><br/>
        "
    ]
];
