within GenKinetics.UnitTests;
model TestDynamicActIrrKinetic

  parameter Real A = 0.5 " fixed concentration of inhibitor";
  parameter Real kA = 0.5 "kinetic parameter";

  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real km = 2.0 "kinetic parameter";

  Internal.AssertContinuousTrajectory check(MaxAccErr=1e-3, name="Dynamic Node")
    annotation (Placement(visible=true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.SAvP SR1(
    A=A,
    kA=kA,
    S0=S0,
    vfwd=vfwd,
    km=km) annotation (Placement(visible=true, transformation(
        origin={-54,38},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.OOSAvP SR2(
    A0=A,
    kA=kA,
    S0=S0,
    vfwd=vfwd,
    km=km) annotation (Placement(visible=true, transformation(
        origin={-58,-58},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR1.v, check.T1) annotation (
    Line(points = {{-44, 38}, {-2, 38}, {-2, 6}, {32, 6}}, color = {0, 0, 127}));
  connect(SR2.r, check.T2) annotation (
    Line(points = {{-48, -58}, {-2, -58}, {-2, -8}, {32, -8}}, color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestDynamicActIrrKinetic;
