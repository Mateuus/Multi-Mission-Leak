private["_array1","_array2","_array3","_random1","_random2","_random3"]; 
 
_array1 = ["dealpoint1_1","dealpoint1_2","dealpoint1_3"]; 
_array2 = ["dealpoint2_1","dealpoint2_2","dealpoint2_3"]; 
_array3 = ["dealpoint3_1","dealpoint3_2","dealpoint3_3"]; 
_random1 = _array1 select floor random count _array1; 
uisleep 0.5; 
_random2 = _array2 select floor random count _array2; 
uisleep 0.5; 
_random3 = _array3 select floor random count _array3; 
 
dealer_1 setpos (getMarkerPos _random1); 
dealer_1 setdir (markerDir _random1); 
dealer_2 setpos (getMarkerPos _random2); 
dealer_2 setdir (markerDir _random2); 
dealer_3 setpos (getMarkerPos _random3); 
dealer_3 setdir (markerDir _random3);