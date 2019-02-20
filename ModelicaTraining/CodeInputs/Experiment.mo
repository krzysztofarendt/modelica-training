within ModelicaTraining.CodeInputs;
model Experiment

  MovingObject obj(a=acc) "Note the binding equation";
  Real acc;

equation
  acc = 1/(time + 1);


end Experiment;
