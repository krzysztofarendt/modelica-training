within ModelicaTraining.CodeExtend;
model CompleteModel
  extends BaseModel;

  Real x;

equation
  // Note that parameter a is not declared in this model!
  der(x) = a - x;

end CompleteModel;
