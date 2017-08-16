#include <macro.h>
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_assurPrice","_assur","_price"];
_control = _this select 0;
_index = _this select 1;
//Fetch some information.
_dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_assur = (_dataArr select 2);
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_price = [_className,GETC(ANL_vehicules)] call TON_fnc_index;
_retrievePrice = (GETC(ANL_vehicules) select _price ) select 1;
_sellPrice = (GETC(ANL_vehicules) select _price ) select 2;
_assurPrice = (GETC(ANL_vehicules) select _price ) select 3;
(getControl(2800,2803)) ctrlSetStructuredText parseText format["
Frais de garage: <t color='#00ffff'>%1€</t><br/>
Prix de vente: <t color='#FF0000'>%2€</t><br/>
Prix assurance: <t color='#8cff9b'>%9€</t><br/>
Etat de l'assurance: %10<br/>
Couleur/type: %8<br/>
Vitesse maximale: %3 km/h<br/>
Puissance du moteur: %4<br/>
Nombre de places: %5<br/>
Capacité du coffre: %6<br/>
Capacité réservoir: %7<br/>
Résistance : %11
",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor,
[_assurPrice] call life_fnc_numberText,
if(_assur == 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>Pas d'assurance</t>"},
_vehicleInfo select 9
];
if(_assur == 1) then {
ctrlShow [97480,False];
}else{
ctrlShow [97480,True];
};
ctrlShow [2805,true];
ctrlShow [2803,true];
ctrlShow [2830,true];