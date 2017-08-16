Switch (_This) do {
Case "BIS_Earthquake": {
   While {Alive Player} Do {
      Playsound "eq";
      _This = Vehicle Player;
      For "_i" from 0 to 140 do {
         _vx = vectorup _this select 0;
         _vy = vectorup _this select 1;
         _vz = vectorup _this select 2;
         _coef = 0.01 - ((Random 0.0004) * _i);
         _This setvectorup [
            _vx+(-_coef+random (2*_coef)),
            _vy+(-_coef+random (2*_coef)),
            _vz+(-_coef+random (2*_coef))
         ];
         sleep (0.01 + random 0.01);
      };
      sleep (60 + Random 180);
   };
};
Default {HintC "Wird nicht so gehen PEEET :)";};
};