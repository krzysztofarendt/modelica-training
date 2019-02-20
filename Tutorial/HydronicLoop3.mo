within ModelicaTraining.Tutorial;
model HydronicLoop3
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
    annotation (Placement(transformation(extent={{-18,-70},{2,-50}})));
  Buildings.Fluid.Sources.FixedBoundary bou(redeclare package Medium = Water,
      nPorts=1)
    annotation (Placement(transformation(extent={{-72,-90},{-52,-70}})));
  Modelica.Blocks.Sources.Step step(
    height=1,
    offset=0,
    startTime=60)
    annotation (Placement(transformation(extent={{-38,36},{-18,56}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo1(redeclare package Medium =
        Water)
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemHotIn(redeclare package
      Medium = Water, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
  Buildings.Fluid.HeatExchangers.Heater_T hea(
    redeclare package Medium = Water,
    m_flow_nominal=1,
    dp_nominal=100)
    annotation (Placement(transformation(extent={{-44,-30},{-64,-10}})));
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Water,
    redeclare package Medium2 = Water,
    m1_flow_nominal=1,
    m2_flow_nominal=1,
    dp1_nominal=100,
    dp2_nominal=100)
    annotation (Placement(transformation(extent={{30,-24},{50,-4}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pump1(
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
    annotation (Placement(transformation(extent={{50,60},{30,80}})));
  Buildings.Fluid.Sources.FixedBoundary sourceCold(
    redeclare package Medium = Water,
    nPorts=2,
    T=273.15) annotation (Placement(transformation(extent={{92,58},{72,78}})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 50)
    annotation (Placement(transformation(extent={{-62,4},{-42,24}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemHotOut(redeclare package
      Medium = Water, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{18,-30},{-2,-10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemColdOut(redeclare package
      Medium = Water, m_flow_nominal=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,30})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemColdIn(redeclare package
      Medium = Water, m_flow_nominal=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={20,30})));
  Modelica.Blocks.Sources.Step step1(
    height=1,
    offset=0,
    startTime=60)
    annotation (Placement(transformation(extent={{-38,70},{-18,90}})));
equation
  connect(pump.port_b, senMasFlo1.port_a)
    annotation (Line(points={{2,-60},{10,-60}}, color={0,127,255}));
  connect(senMasFlo1.port_b, senTemHotIn.port_a)
    annotation (Line(points={{30,-60},{40,-60}}, color={0,127,255}));
  connect(bou.ports[1], pump.port_a) annotation (Line(points={{-52,-80},{-40,
          -80},{-40,-60},{-18,-60}}, color={0,127,255}));
  connect(step.y, pump.m_flow_in)
    annotation (Line(points={{-17,46},{-8,46},{-8,-48}}, color={0,0,127}));
  connect(hea.port_b, pump.port_a) annotation (Line(points={{-64,-20},{-70,-20},
          {-70,-60},{-18,-60}}, color={0,127,255}));
  connect(senTemHotIn.port_b, hex.port_a2) annotation (Line(points={{60,-60},{
          70,-60},{70,-20},{50,-20}}, color={0,127,255}));
  connect(pump1.port_a, sourceCold.ports[1])
    annotation (Line(points={{50,70},{72,70}}, color={0,127,255}));
  connect(const.y, hea.TSet) annotation (Line(points={{-41,14},{-34,14},{-34,
          -12},{-42,-12}}, color={0,0,127}));
  connect(hex.port_b2, senTemHotOut.port_a)
    annotation (Line(points={{30,-20},{18,-20}}, color={0,127,255}));
  connect(senTemHotOut.port_b, hea.port_a)
    annotation (Line(points={{-2,-20},{-44,-20}}, color={0,127,255}));
  connect(hex.port_b1, senTemColdOut.port_a)
    annotation (Line(points={{50,-8},{60,-8},{60,20}}, color={0,127,255}));
  connect(senTemColdOut.port_b, sourceCold.ports[2])
    annotation (Line(points={{60,40},{60,66},{72,66}}, color={0,127,255}));
  connect(pump1.port_b, senTemColdIn.port_a)
    annotation (Line(points={{30,70},{20,70},{20,40}}, color={0,127,255}));
  connect(senTemColdIn.port_b, hex.port_a1)
    annotation (Line(points={{20,20},{20,-8},{30,-8}}, color={0,127,255}));
  connect(step1.y, pump1.m_flow_in) annotation (Line(points={{-17,80},{12,80},{
          12,90},{40,90},{40,82}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<h1>Example of two hydronic loops with a HX</h1>

The bottom loop is the hot side, the upper loop is the cold side. The fluid
in the cold side is taken directly from the source model (boundary temperature 20degC).
Note the different type of boundary model connection between the hot and cold loops.

</html>"));
end HydronicLoop3;
