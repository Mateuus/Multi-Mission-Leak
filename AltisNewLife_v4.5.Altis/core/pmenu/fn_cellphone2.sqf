/*
File: fn_cellphone2.sqf
Author: Timo
 
Description:
With no radio cant use Cellphone
*/
 
 
if("ItemRadio" in assignedItems player) then {
createDialog "Life_cell_phone"; // or /** Life_my_smartphone **\ if you use the SQL Based Smartphone   By Silex ( http://www.altislife...sed-smartphone/ )
}else{
hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#AEEE00'>Pas de telephone</t><br/><br/>
<t size='0.90 'font='puristaLight' align='left'>Vous devez avoir un telephone pour utiliser ca. Vous pouvez en acheter un dans une boutique</t><br/>"];
};
