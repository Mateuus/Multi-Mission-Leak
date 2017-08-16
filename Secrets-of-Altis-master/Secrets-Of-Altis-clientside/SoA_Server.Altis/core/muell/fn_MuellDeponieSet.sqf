/*#######################################
#	Muelldeponie Set Config				#
#	Author: [MdF] Feindflug				#
#######################################*/

if(muell_counter > 0) then
{
	muell_counter = muell_counter - 1;
} else {
	muell_counter = 0;
};
publicvariable "muell_counter";
[] call life_fnc_hudUpdate;