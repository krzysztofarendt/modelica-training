within ModelicaTraining.CodeSimple;
model Model1 "Simple derivative"
  Real x;

equation
  1 - x = der(x);

end Model1;
