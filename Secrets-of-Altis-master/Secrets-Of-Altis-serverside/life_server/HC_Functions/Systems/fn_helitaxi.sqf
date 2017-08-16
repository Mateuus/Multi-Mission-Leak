 
_taxis = [Helitaxi1,Helitaxi2,Helitaxi3,Helitaxi4]; 
 
{ 
_city = ""; 
 
_x allowDamage false; 
_x lock 0; 
clearWeaponCargoGlobal _x;  
clearMagazineCargoGlobal _x;  
clearItemCargoGlobal _x; 
removeallWeapons _x; 
 
switch (_x) do { 
case Helitaxi1: {_city = "nach Kavala"}; 
case Helitaxi2: {_city = "nach Pyrgos"}; 
case Helitaxi3: {_city = "nach Sofia"}; 
case Helitaxi4: {_city = "zur JVA"}; 
}; 
 
_x setVariable ["realname",format["Helitaxi %1",_city],true];  
 
} foreach _taxis;