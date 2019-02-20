within ModelicaTraining.CodeInputs;
model MovingObject

  input Real a "Acceleration";

  Real x "Position";
  Real v "Speed";

equation
  der(x) = v;
  der(v) = a;

end MovingObject;
