within GenKinetics.UnitTests;
model TestDynamicRevKinetic

  parameter Real S0 = 1.0;
  parameter Real vfwd = 1.0;
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real kmP = 0.3 "kinetic parameter";

  Internal.AssertContinuousTrajectory check(MaxAccErr=1e-3, name=
        "Dynamic Reversible Kinetic") annotation (Placement(visible=true,
        transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  GenKinetics.UnitTests.Internal.OOSvP_rev SR1(
    S0=S0,
    vfwd=vfwd,
    vbwd=vbwd,
    kmS=kmS,
    kmP=kmP) "Simple Reversible Reaction" annotation (Placement(visible=true,
        transformation(
        origin={-54,44},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.SvP_rev SR2(
    S0=S0,
    vfwd=vfwd,
    vbwd=vbwd,
    kmS=kmS,
    kmP=kmP) "Simple Reversible Reaction" annotation (Placement(visible=true,
        transformation(
        origin={-44,-48},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR2.v, check.T2) annotation (
    Line(points = {{-34, -48}, {-6, -48}, {-6, -8}, {32, -8}}, color = {0, 0, 127}));
  connect(SR1.r, check.T1) annotation (
    Line(points = {{-44, 44}, {-14, 44}, {-14, 6}, {32, 6}}, color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestDynamicRevKinetic;
