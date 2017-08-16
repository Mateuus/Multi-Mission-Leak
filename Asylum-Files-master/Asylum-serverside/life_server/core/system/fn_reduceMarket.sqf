 
 
 
 
 
 
 
 
private ["_x","_i","_toReduce"]; 
 
_toReduce = ["cocainep","diamond","diamondf","meth","cocainepure","turtle","heroin","heroinp","iron_r","marijuana","marijuanam","oilp","pearl","salt_r","goldbar","dog","dogp","scotch_3","scotch_2","phos","diamondr","goatp","hydro","sheep","sheepp","rum_3","gingerale_0"]; 
 
for "_i" from 0 to ((count life_price_index) - 1) do 
{ 
_x = life_price_index select _i; 
_value = _x select 1; 
if (_x select 0 in _toReduce) then 
{ 
_demand = (_x select 0) call life_fnc_itemDemand; 
_percent = (_value * 50) / _demand;  
if (_percent > 70) then { _percent = 70; }; 
if (_percent < 30) then { _percent = 30; }; 
_value = floor (_value - (_value * (_percent / 100))); 
_x set [1, _value];  
life_price_index set [_i, _x]; 
}; 
}; 
 
publicVariable "life_price_index";