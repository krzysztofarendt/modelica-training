within ModelicaTraining.CodeInputs;
model ExperimentVisual
  MovingObjectVisInp movingObjectVisInp
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Pulse pulse(period=10)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
equation
  connect(movingObjectVisInp.a, pulse.y)
    annotation (Line(points={{-10.8,0},{-33,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ExperimentVisual;
