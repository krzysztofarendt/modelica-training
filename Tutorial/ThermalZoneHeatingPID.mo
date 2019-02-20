within ModelicaTraining.Tutorial;
model ThermalZoneHeatingPID
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
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{92,30},{112,50}})));
  Buildings.Controls.Continuous.LimPID conPID(reverseAction=true)
    annotation (Placement(transformation(extent={{52,-10},{32,10}})));
  Modelica.Blocks.Sources.Constant tempStp(k=294.15)
    annotation (Placement(transformation(extent={{-8,-40},{12,-20}})));
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
  connect(temperatureSensor.T, conPID.u_s) annotation (Line(points={{112,40},{
          122,40},{122,0},{54,0}}, color={0,0,127}));
  connect(conPID.y, hea.u) annotation (Line(points={{31,0},{-26,0},{-26,-60},{
          -20,-60}}, color={0,0,127}));
  connect(tempStp.y, conPID.u_m)
    annotation (Line(points={{13,-30},{42,-30},{42,-12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ThermalZoneHeatingPID;
