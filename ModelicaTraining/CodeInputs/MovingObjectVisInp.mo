within ModelicaTraining.CodeInputs;
model MovingObjectVisInp

  Modelica.Blocks.Interfaces.RealInput a
    annotation (Placement(transformation(extent={{-128,-20},{-88,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));

  Real x "Position";
  Real v "Speed";

equation
  der(x) = v;
  der(v) = a;
  y = x;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end MovingObjectVisInp;
