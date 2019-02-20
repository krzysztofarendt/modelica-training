within ModelicaTraining.Tutorial;
model ThermalZoneHeatingOnOff
  extends ThermalZone;
  replaceable package Water = Buildings.Media.Water;
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
        Water, m_flow_nominal=0.1)
    annotation (Placement(transformation(extent={{-54,-76},{-34,-56}})));
  Buildings.Fluid.HeatExchangers.HeaterCooler_u hea(
    redeclare package Medium = Water,
    m_flow_nominal=0.1,
    dp_nominal=10,
    Q_flow_nominal=5000)
    annotation (Placement(transformation(extent={{-18,-76},{2,-56}})));
  Buildings.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad(
    redeclare package Medium = Water,
    Q_flow_nominal=5000,
    T_a_nominal=313.15,
    T_b_nominal=303.15,
    TAir_nominal=293.15)
    annotation (Placement(transformation(extent={{12,-76},{32,-56}})));
  Buildings.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium
      = Water)
    annotation (Placement(transformation(extent={{-86,-76},{-66,-56}})));
  Modelica.Blocks.Sources.Constant const(k=0.1)
    annotation (Placement(transformation(extent={{-76,-40},{-56,-20}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=293.15, uHigh=295.15)
    annotation (Placement(transformation(extent={{52,-24},{32,-4}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{92,30},{112,50}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,-24},{-20,-4}})));
  Modelica.Blocks.Sources.Constant uLow(k=0)
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Blocks.Sources.Constant uHigh(k=1)
    annotation (Placement(transformation(extent={{-20,-52},{0,-32}})));
equation
  connect(fan.port_b, hea.port_a)
    annotation (Line(points={{-34,-66},{-18,-66}}, color={0,127,255}));
  connect(rad.heatPortRad, roo.heaPorRad) annotation (Line(points={{24,-58.8},{
          24,36.2},{65,36.2}}, color={191,0,0}));
  connect(rad.heatPortCon, roo.heaPorAir)
    annotation (Line(points={{20,-58.8},{20,40},{65,40}}, color={191,0,0}));
  connect(hea.port_b, rad.port_a)
    annotation (Line(points={{2,-66},{12,-66}}, color={0,127,255}));
  connect(rad.port_b, fan.port_a) annotation (Line(points={{32,-66},{38,-66},{
          38,-86},{-60,-86},{-60,-66},{-54,-66}}, color={0,127,255}));
  connect(bou.ports[1], fan.port_a)
    annotation (Line(points={{-66,-66},{-54,-66}}, color={0,127,255}));
  connect(const.y, fan.m_flow_in)
    annotation (Line(points={{-55,-30},{-44,-30},{-44,-54}}, color={0,0,127}));
  connect(temperatureSensor.port, roo.heaPorAir)
    annotation (Line(points={{92,40},{65,40}}, color={191,0,0}));
  connect(temperatureSensor.T, hysteresis.u) annotation (Line(points={{112,40},
          {118,40},{118,-14},{54,-14}}, color={0,0,127}));
  connect(hysteresis.y, switch1.u2)
    annotation (Line(points={{31,-14},{2,-14}}, color={255,0,255}));
  connect(switch1.y, hea.u) annotation (Line(points={{-21,-14},{-26,-14},{-26,
          -60},{-20,-60}}, color={0,0,127}));
  connect(uLow.y, switch1.u1)
    annotation (Line(points={{1,20},{10,20},{10,-6},{2,-6}}, color={0,0,127}));
  connect(uHigh.y, switch1.u3) annotation (Line(points={{1,-42},{10,-42},{10,
          -22},{2,-22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ThermalZoneHeatingOnOff;
