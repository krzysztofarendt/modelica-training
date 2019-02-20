within ModelicaTraining.CodeSimple;
model Model3 "Energy balance equation"
  // Types
  type Temperature = Real(unit="K", min=0);
  type SpecificHeat = Real(unit="J/(kg.K)", min=0);
  type Volume = Real(unit="m3", min=0);
  type Density = Real(unit="kg/m3", min=0);
  type Heat = Real(unit="W");

  // Parameters
  parameter SpecificHeat c = 1000 "Material specific heat";
  parameter Volume V = 10 "Body volume";
  parameter Density rho = 500 "Material density";

  // State variables
  Temperature T "Body temperature";
  Heat q "Heat load";

initial equation
  T = 293.17;

equation
  rho * c * V * der(T) = q;
  q = sin(time / 86400 * 2 * 3.14) * 10000;

  // Annotation used to set the default simulation time
  annotation(experiment(StartTime=0,StopTime=86400));
end Model3;
