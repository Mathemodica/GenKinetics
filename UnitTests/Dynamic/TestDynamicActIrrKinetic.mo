within GenKinetics.UnitTests.Dynamic;
model TestDynamicActIrrKinetic

  parameter Real A = 0.5 " fixed concentration of inhibitor";
  parameter Real kA = 0.5 "kinetic parameter";

  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real km = 2.0 "kinetic parameter";

  Validate check(MaxAccErr=1e-3, name="Dynamic ActIrrKinetic") annotation (
      Placement(visible=true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Explicit.SAvP SR1(
    A=A,
    kA=kA,
    S0=S0,
    vfwd=vfwd,
    km=km) annotation (Placement(visible=true, transformation(
        origin={-54,38},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Dynamic.SAvP SR2(
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
    Line(points={{-44,37.6},{-2,37.6},{-2,6.6},{32.4,6.6}},color = {0, 0, 127}));
  connect(SR2.r, check.T2) annotation (
    Line(points={{-47.8,-58.4},{-2,-58.4},{-2,-7.6},{32.6,-7.6}},
                                                               color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestDynamicActIrrKinetic;
