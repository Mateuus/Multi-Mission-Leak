/*

	Author Shinji
	Setzt den neuen Broadcast raus!

*/
_array = _this select 3;
_redakteur = [_array,0,"",[""]] call BIS_fnc_param;


hint parseText format ["Die Altis Redaktion hat eine Neue Zeitung auf dem Markt. Der Redakteur <t size='1.25' font='TahomaB' color='#8112B9'>%1</t> Bedankt sich bei allen Lesern.",_redakteur];