private["_mode"];

if(!radio_active) exitWith {hint "Derzeit ist kein Sender verfügbar."};
if(life_radio) exitWith {hint "Du hast das Radio schon eingeschaltet! Wechsel einfach zum Sender!"};
life_radio = true;

life_radio_radio radioChannelAdd [player];
14 enableChannel false;

life_radio_action = player addAction["Radio ausschalten",{life_radio = false},0,0,false,false,"",'!isnull objectParent player && life_radio'];

WaitUntil {sleep 0.1; isnull objectParent player || !life_radio};
life_radio = false;

player removeAction life_radio_action;
life_radio_radio radioChannelRemove [player];

hint "Radio ausgeschaltet";