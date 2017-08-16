 
_list = [ 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
[Dealer_1,"images\uniforms
euling_co.paa"], 
[Dealer_2,"images\uniforms
euling_co.paa"], 
[Dealer_3,"images\uniforms
euling_co.paa"], 
 
 
[autokavala1,"images\vehicles\suv_space.paa"], 
[autokavala2,"images\vehicles\poly_suv_co.paa"], 
[autokavala3,"images\vehicles\suv_pixel_co.paa"], 
[autokavala4,"images\vehicles\offroad_pizza_co.paa"], 
[autokavala5,"images\vehicles\hatchback_brokencat.paa"], 
[autokavala6,"images\vehicles\offroad_blackmagic_co.paa"], 
[autokavala7,"images\vehicles\hatchback_asiimov_co.paa"], 
 
 
[rarzeug1,"#(argb,8,8,3)color(1,0.5,0,1)"], 
[rarzeug2,"#(argb,8,8,3)color(1,0.5,0,1)"], 
[rarzeug3,"#(argb,8,8,3)color(1,0.5,0,1)"], 
[rarzeug4,"#(argb,8,8,3)color(1,0.5,0,1)"], 
 
 
[Helitaxi1,"images\vehicles\automatisch_heli.paa"], 
[Helitaxi2,"images\vehicles\automatisch_heli.paa"], 
[Helitaxi3,"images\vehicles\automatisch_heli.paa"], 
[Helitaxi4,"images\vehicles\automatisch_heli.paa"] 
 
]; 
 
{ ((_x select 0) setobjecttextureglobal [0,(_x select 1)]) } forEach _list;