private["_unit","_dText","_weed","_cocaine","_meth","_lsd","_heroin"];

_unit = param [0,objNull,[objNull]];
if(isNull _unit) exitWith {};
hintSilent "Testing for Drugs...";
sleep 2;

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hintSilent "Test Failed."};

if(_unit getVariable["drug_weed",false]) then { _weed = "Positive"; } else { _weed = "Negative"; };
if(_unit getVariable["drug_cocaine",false]) then { _cocaine = "Positive"; } else { _cocaine = "Negative"; };
if(_unit getVariable["drug_meth",false]) then { _meth = "Positive"; } else { _meth = "Negative"; };
if(_unit getVariable["drug_mushroom",false]) then { _lsd = "Positive"; } else { _lsd = "Negative"; };
if(_unit getVariable["drug_heroin",false]) then { _heroin = "Positive"; } else { _heroin = "Negative"; };

hintSilent parseText format["<t color='#FF0000'><t size='1'>%1</t></t><br/><t color='#FFD700'>Marijuana: </t>%2<br/><t color='#FFD700'>Cocaine: </t>%3<br/><t color='#FFD700'>Meth: </t>%4<br/><t color='#FFD700'>Mushrooms: </t>%5<br/><t color='#FFD700'>Heroin: </t>%6<br/>"
,name _unit,_weed,_cocaine,_meth,_lsd,_heroin];
