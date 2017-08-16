/* 
	File: fn_HCC.sqf	
	Headless Client Check
*/
_result = 2;
if(!isNil("life_HC_isActive") && {life_HC_isActive}) then {
    _result = hc_1;
};
_result;