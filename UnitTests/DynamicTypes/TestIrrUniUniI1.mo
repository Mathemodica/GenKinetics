within GenKinetics.UnitTests.DynamicTypes;
model TestIrrUniUniI1
  parameter Real I = 0.3;
  parameter Real kI = 0.77;
  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real km = 2.0 "kinetic parameter";
  Validate checkv(MaxAccErr=1e-3, name="DynamicTypes IrrUniUni v") annotation (
      Placement(visible=true, transformation(
        origin={42,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Validate checkS(MaxAccErr=1e-3, name="DynamicTypes IrrUniUni S") annotation (
      Placement(visible=true, transformation(
        origin={38,64},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Validate checkP(MaxAccErr=1e-3, name="DynamicTypes IrrUniUni P") annotation (
      Placement(visible=true, transformation(
        origin={36,-78},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Internal.Explicit.SIvP SR1(
    I=I,
    kI=kI,
    S0=S0,
    vfwd=vfwd,
    km=km) annotation (Placement(visible=true, transformation(
        origin={-56,32},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OOModels.SIvP SR2(
    I0=I,
    kI=kI,
    S0=S0,
    vfwd=vfwd,
    km=km) annotation (Placement(visible=true, transformation(
        origin={-54,-28},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(SR2.Pc, checkP.T2) annotation (
    Line(points={{-44,-35.8},{-8,-35.8},{-8,-85.6},{26.6,-85.6}},color = {0, 0, 127}));
  connect(SR1.P, checkP.T1) annotation (
    Line(points={{-46.2,23.6},{-26,23.6},{-26,-71.4},{26.4,-71.4}},
                                                                 color = {0, 0, 127}));
  connect(SR2.r, checkv.T2) annotation (
    Line(points={{-43.8,-28.4},{4,-28.4},{4,-7.6},{32.6,-7.6}},
                                                             color = {0, 0, 127}));
  connect(SR1.v, checkv.T1) annotation (
    Line(points={{-46,31.6},{4,31.6},{4,6.6},{32.4,6.6}},color = {0, 0, 127}));
  connect(SR2.Sc, checkS.T2) annotation (
    Line(points={{-43.8,-21.6},{-8,-21.6},{-8,56.4},{28.6,56.4}},
                                                               color = {0, 0, 127}));
  connect(SR1.S, checkS.T1) annotation (
    Line(points={{-46,39.2},{-14,39.2},{-14,70.6},{28.4,70.6}},color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end TestIrrUniUniI1;
