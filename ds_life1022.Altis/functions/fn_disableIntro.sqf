/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Enables/disabled the server intro for the player
*/

if((DS_realEstateArray select 26) == 0)then {
	hint "Server intro disabled. Sync your data to save this setting";
	DS_realEstateArray set [26,1];
} else {
	hint "Server intro enabled. Sync your data to save this setting";
	DS_realEstateArray set [26,0];
};