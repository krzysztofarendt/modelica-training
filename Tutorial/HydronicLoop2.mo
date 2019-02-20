within ModelicaTraining.Tutorial;
model HydronicLoop2
  extends Modelica.Icons.Example;

  replaceable package Water = Buildings.Media.Water "Water from Buildings lib";

  Buildings.Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Water,
    addPowerToMedium=true,
    redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to4 per(
        pressure(V_flow={5.55555555556e-07,0.000402190923318,0.00052269170579,
            0.000643192488263,0.000752738654147,0.000866979655712,
            0.000973395931142,0.00108607198748,0.00115962441315}, dp={
            17066.9518717,16997.0053476,16437.4331551,15528.1283422,
            14408.9839572,13149.9465241,11681.0695187,9932.40641711,
            8533.47593583})),
    m_flow_nominal=1)
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
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo2(redeclare package Medium =
        Water)
    annotation (Placement(transformation(extent={{-28,10},{-48,30}})));
equation
  connect(pump.port_b, senMasFlo1.port_a)
    annotation (Line(points={{-4,-20},{20,-20}}, color={0,127,255}));
  connect(senMasFlo1.port_b, senTem.port_a)
    annotation (Line(points={{40,-20},{50,-20}}, color={0,127,255}));
  connect(bou.ports[1], pump.port_a) annotation (Line(points={{-42,-40},{-30,-40},
          {-30,-20},{-24,-20}}, color={0,127,255}));
  connect(senMasFlo2.port_b, pump.port_a) annotation (Line(points={{-48,20},{-80,
          20},{-80,-20},{-24,-20}}, color={0,127,255}));
  connect(step.y, pump.m_flow_in)
    annotation (Line(points={{-23,60},{-14,60},{-14,-8}}, color={0,0,127}));
  connect(senTem.port_b, senMasFlo2.port_a) annotation (Line(points={{70,-20},{
          80,-20},{80,20},{-28,20}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<h1>Example of a simple hydronic loop with a mass flow controlled pump</h1>

Pressure drop in the system is no longer important. This kind of pump makes the model
less physical, can run you into numerical problems, but is easier,
because requires less parameters to calibrate.

</html>"));
end HydronicLoop2;
