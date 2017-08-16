//Was soll es denn Laden , Haha :P

// Progress-Bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Lade Serverinformationen... (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
while{true} do
{
    sleep 0.33;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["Lade Serverinformationen... (%1%2)...",round(_cP * 100),"%"];
    if(_cP >= 1) exitWith {};
};

5 cutText ["Serverinformationen geladen, viel Spaß auf dem michecortes.de Gaming Server","PLAIN"];
