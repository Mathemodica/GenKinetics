within GenKinetics.UnitTests.Dynamic;
model TestLinLogKinetic

  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real P0 = 0.1 "Initial concentration of P";

  parameter Real v_steady = 1.0 "reference steady-state reaction rate";

  parameter Real alpha = 1.0 "elasticity";
  parameter Real theta = -2.5 "elasticity";

  parameter Real S_steady = 0.1;
  parameter Real P_steady = 0.1;

  Internal.Explicit.SvP_LinLog SR1(
    S0=S0,
    P0=P0,
    v_steady=v_steady,
    alpha=alpha,
    theta=theta,
    S_steady=S_steady,
    P_steady=P_steady) annotation (Placement(visible=true, transformation(
        origin={-50,46},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Dynamic.SvP_LinLog SR2(
    S0=S0,
    P0=P0,
    v_steady=v_steady,
    alpha=alpha,
    theta=theta,
    S_steady=S_steady,
    P_steady=P_steady) annotation (Placement(visible=true, transformation(
        origin={-46,-36},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  AssertContinuousTrajectory check(MaxAccErr=1e-3, name="LinLog Kinetic")
    annotation (Placement(visible=true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR2.Sc, check.T2) annotation (
    Line(points = {{-35.8, -29.6}, {-4, -29.6}, {-4, -7.6}, {32.6, -7.6}}, color = {0, 0, 127}));
  connect(SR1.S, check.T1) annotation (
    Line(points = {{-40, 53.2}, {-4, 53.2}, {-4, 6.6}, {32.4, 6.6}}, color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestLinLogKinetic;
