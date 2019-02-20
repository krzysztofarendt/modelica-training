within ModelicaTraining.Tutorial;
model HydronicLoop1
  extends Modelica.Icons.Example;

  replaceable package Water = Buildings.Media.Water "Water from Buildings lib";

  Buildings.Fluid.Movers.SpeedControlled_y pump(
    redeclare package Medium = Water,
    addPowerToMedium=true,
    redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to4 per(
        pressure(V_flow={5.55555555556e-07,0.000402190923318,0.00052269170579,
            0.000643192488263,0.000752738654147,0.000866979655712,
            0.000973395931142,0.00108607198748,0.00115962441315}, dp={
            17066.9518717,16997.0053476,16437.4331551,15528.1283422,
            14408.9839572,13149.9465241,11681.0695187,9932.40641711,
            8533.47593583})))
    annotation (Placement(transformation(extent={{-24,-30},{-4,-10}})));
  Buildings.Fluid.Sources.FixedBoundary bou(redeclare package Medium = Water,
      nPorts=1)
    annotation (Placement(transformation(extent={{-62,-50},{-42,-30}})));
  Modelica.Blocks.Sources.Step step(
    height=1,
    offset=0,
    startTime=60)
    annotation (Placement(transformation(extent={{-44,50},{-24,70}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo1(redeclare package Medium =
        Water)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Water, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = Water,
    m_flow_nominal=1,
    dp_nominal=10000)
    annotation (Placement(transformation(extent={{54,10},{34,30}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo2(redeclare package Medium =
        Water)
    annotation (Placement(transformation(extent={{-28,10},{-48,30}})));
  Modelica.Blocks.Interfaces.RealOutput pmpPower
    annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
equation
  connect(step.y, pump.y)
    annotation (Line(points={{-23,60},{-14,60},{-14,-8}}, color={0,0,127}));
  connect(pump.port_b, senMasFlo1.port_a)
    annotation (Line(points={{-4,-20},{20,-20}}, color={0,127,255}));
  connect(senMasFlo1.port_b, senTem.port_a)
    annotation (Line(points={{40,-20},{50,-20}}, color={0,127,255}));
  connect(bou.ports[1], pump.port_a) annotation (Line(points={{-42,-40},{-30,-40},
          {-30,-20},{-24,-20}}, color={0,127,255}));
  connect(senTem.port_b, res.port_a) annotation (Line(points={{70,-20},{80,-20},
          {80,20},{54,20}}, color={0,127,255}));
  connect(res.port_b, senMasFlo2.port_a)
    annotation (Line(points={{34,20},{-28,20}}, color={0,127,255}));
  connect(senMasFlo2.port_b, pump.port_a) annotation (Line(points={{-48,20},{-80,
          20},{-80,-20},{-24,-20}}, color={0,127,255}));
  connect(pump.P, pmpPower) annotation (Line(points={{-3,-11},{9.5,-11},{9.5,-60},
          {106,-60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<h1>Example of a simple hydronic loop</h1>

Try the following:
<ul>
<li> Connect the fixed boundary source to two points, instead of one.
<li> Disable "                      " in the pump model.
<li> Change pressure drop in the pipe and compare mass flow rates.
<li> Create your own pump based on some performance curve.
</ul>

</html>"));
end HydronicLoop1;
