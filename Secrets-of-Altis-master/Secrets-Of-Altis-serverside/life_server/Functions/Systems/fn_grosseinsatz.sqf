_mode = _this select 0; 
 
switch(_mode) do { 
 
case "bank": { 
life_bankraub = true; 
publicVariable "life_bankraub"; 
sleep (35 * 60); 
life_bankraub = false; 
publicVariable "life_bankraub"; 
}; 
 
case "galerie": { 
life_galerieraub = true; 
publicVariable "life_galerieraub"; 
sleep (35 * 60); 
life_galerieraub = false; 
publicVariable "life_galerieraub"; 
}; 
};