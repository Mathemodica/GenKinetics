within GenKinetics.UnitTests.Dynamic;
model TestDynamicIrrKinetic
  parameter Real km = 2.0;
  parameter Real S0 = 1.0;
  parameter Real vfwd = 1.0;
  Internal.Explicit.SvP SR1(
    km=km,
    S0=S0,
    vfwd=vfwd) annotation (Placement(visible=true, transformation(
        origin={-50,46},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Dynamic.OOSvP SR2(
    km=km,
    S0=S0,
    vfwd=vfwd) annotation (Placement(visible=true, transformation(
        origin={-46,-36},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  AssertContinuousTrajectory check(MaxAccErr=1e-3, name=
        "Dynamic Irreversible Kinetic") annotation (Placement(visible=true,
        transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR2.r, check.T2) annotation (
    Line(points={{-35.8,-36.4},{-2,-36.4},{-2,-7.6},{32.6,-7.6}},
                                                               color = {0, 0, 127}));
  connect(SR1.v, check.T1) annotation (
    Line(points={{-40,45.6},{-2,45.6},{-2,6.6},{32.4,6.6}},color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestDynamicIrrKinetic;
