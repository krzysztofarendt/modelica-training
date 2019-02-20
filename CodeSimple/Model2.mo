within ModelicaTraining.CodeSimple;
model Model2 "Simple derivative with initial equation and a parameter"
  // Parameters
  parameter Real a = 5 "Model parameter";

  // States
  Real x "State variable";

initial equation
  x = 10;

equation
  der(x) = a - x;

  // Annotation used to set the default simulation time
  annotation(experiment(StartTime=0,StopTime=10));
end Model2;
