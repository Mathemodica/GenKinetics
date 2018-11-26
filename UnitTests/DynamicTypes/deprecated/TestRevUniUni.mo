within GenKinetics.UnitTests.DynamicTypes.deprecated;
model TestRevUniUni "Test S <=> P "

  parameter Real S0 = 1.0;
  parameter Real vfwd = 1.0;
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real kmP = 0.3 "kinetic parameter";

  Validate check(MaxAccErr=1e-3, name="DynamicTypes RevUniUni Kinetic")
    annotation (Placement(visible=true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OOModels.SvP_rev SR1(
    S0=S0,
    vfwd=vfwd,
    vbwd=vbwd,
    kmS=kmS,
    kmP=kmP) "Simple Reversible Reaction" annotation (Placement(visible=true,
        transformation(
        origin={-54,44},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Explicit.SvP_rev SR2(
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
    Line(points={{-34,-48.4},{-6,-48.4},{-6,-7.6},{32.6,-7.6}},color = {0, 0, 127}));
  connect(SR1.r, check.T1) annotation (
    Line(points={{-43.8,43.6},{-14,43.6},{-14,6.6},{32.4,6.6}},
                                                             color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestRevUniUni;
