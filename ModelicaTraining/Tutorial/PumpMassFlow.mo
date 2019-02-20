within ModelicaTraining.Tutorial;
model PumpMassFlow
  extends Modelica.Icons.Example;
  replaceable package Air = Buildings.Media.Air;
  Buildings.Fluid.Movers.FlowControlled_m_flow
                                           fan(
    redeclare package Medium = Air,
    addPowerToMedium=false,
    redeclare Data.AhuFan per,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = Air,
    dp_nominal=300,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Buildings.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium =
        Air)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  Buildings.Fluid.Sources.FixedBoundary bou1(nPorts=1, redeclare package Medium =
        Air)
    annotation (Placement(transformation(extent={{74,-10},{54,10}})));
  Modelica.Blocks.Sources.Constant const(k=5)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
equation
  connect(fan.port_b, res.port_a)
    annotation (Line(points={{-40,0},{-20,0}}, color={0,127,255}));
  connect(res.port_b, senMasFlo.port_a)
    annotation (Line(points={{0,0},{20,0}}, color={0,127,255}));
  connect(fan.port_a, bou.ports[1])
    annotation (Line(points={{-60,0},{-76,0}}, color={0,127,255}));
  connect(senMasFlo.port_b, bou1.ports[1])
    annotation (Line(points={{40,0},{54,0}}, color={0,127,255}));
  connect(const.y, fan.m_flow_in)
    annotation (Line(points={{-59,50},{-50,50},{-50,12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PumpMassFlow;
