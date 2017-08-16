/*
	Will be revised later
*/
if((damage player) < 0.25) exitWith {};

if(!("Medikit" in (items player))) exitWith {};

if (side player in [east,civilian]) then {
player removeItem "Medikit";
};


player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uisleep 10;
eM_face_hub = 0.25;
eM_neck = 0.25;
eM_head = 0.25;
eM_pelvis = 0.25;
eM_spine1 = 0.25;
eM_spine2 = 0.25;
eM_spine3 = 0.25;
eM_body = 0.25; 
eM_arms = 0.25;
eM_hands = 0.25;
eM_legs = 0.25;
eM_damage_null = 0.25;