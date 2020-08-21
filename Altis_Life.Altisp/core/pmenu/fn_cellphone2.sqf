/*
	File: fn_cellphone2.sqf
	Author: Timo
 
	Description:
	With no radio cant use Cellphone
*/
 
if("ItemRadio" in assignedItems player) then {
if(!(player getVariable "restrained") && !(animationState player in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"])) then {
	createDialog "Life_cell_phone"; 
}else{
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Telefon</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Nie możesz korzystać z telefonu.</t><br/>"];
}
}else{
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Bez Telefonu</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Musisz mieć telefon, aby móc wysłać SMS ALN.</t><br/>"];
};