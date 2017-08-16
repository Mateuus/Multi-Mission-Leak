private["_unit","_dText","_weed","_cocaine","_pbrau","_sprit","_heroin","_alk"];

_unit = cursorTarget;
if(isNull _unit) exitWith {};

hint "Teste nach Drogen & Alkohol...";
sleep 2;

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Test fehlgeschlagen."};

if(_unit getVariable["drug_weed",false]) then { _weed = "Positiv"; } else { _weed = "Negativ"; };
if(_unit getVariable["drug_cocaine",false]) then { _cocaine = "Positiv"; } else { _cocaine = "Negativ"; };
if(_unit getVariable["drug_pbrau",false]) then { _pbrau = "Positiv"; } else { _pbrau = "Negativ"; };
if(_unit getVariable["drug_sprit",false]) then { _sprit = "Positiv"; } else { _sprit = "Negativ"; };
if(_unit getVariable["drug_heroin",false]) then { _heroin = "Positiv"; } else { _heroin = "Negativ"; };
if(_unit getVariable["drug_alk",false]) then { _alk = "Positiv"; } else { _alk = "Negativ"; };

hint parseText format["<t color='#FF0000'><t size='1'>%1</t></t><br/><t color='#FFD700'>Marihuana: </t>%2<br/><t color='#FFD700'>Kokain: </t>%3<br/><t color='#FFD700'>Starkbier: </t>%4<br/><t color='#FFD700'>Spirituosen: </t>%5<br/><t color='#FFD700'>Heroin: </t>%6<br/><t color='#FFD700'>Alkohol: </t>%7<br/><br/><t color='#FF0000'>%8</t>"
,name _unit,_weed,_cocaine,_pbrau,_sprit,_heroin,_alk];