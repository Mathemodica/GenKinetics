within GenKinetics.UnitTests.Dynamic;
model TestDynamicInhRevKinetic

  parameter Real I = 0.5 " fixed concentration of inhibitor";
  parameter Real kI = 0.5 "kinetic parameter";

  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.5 "kinetic parameter";
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real kmP = 0.3 "kinetic parameter";

  Internal.AssertContinuousTrajectory check(MaxAccErr=1e-3, name=
        "Dynamic Inhibited Reversible Kinetic") annotation (Placement(visible=
          true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Dynamic.OOSIvP_rev SR1(
    I0=I,
    kI=kI,
    S0=S0,
    vfwd=vfwd,
    vbwd=vbwd,
    kmS=kmS,
    kmP=kmP) "Simple Reaction" annotation (Placement(visible=true,
        transformation(
        origin={-54,46},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Explicit.SIvP_rev SR2(
    I=I,
    kI=kI,
    S0=S0,
    vfwd=vfwd,
    vbwd=vbwd,
    kmS=kmS,
    kmP=kmP) "Simple reaction" annotation (Placement(visible=true,
        transformation(
        origin={-54,-58},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR2.v, check.T2) annotation (
    Line(points={{-44,-58.4},{-6,-58.4},{-6,-7.6},{32.6,-7.6}},color = {0, 0, 127}));
  connect(SR1.r, check.T1) annotation (
    Line(points={{-43.8,45.6},{-8,45.6},{-8,6.6},{32.4,6.6}},
                                                           color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestDynamicInhRevKinetic;
