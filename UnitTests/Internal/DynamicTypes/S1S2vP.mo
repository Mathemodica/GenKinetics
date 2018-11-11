within GenKinetics.UnitTests.Internal.DynamicTypes;
model S1S2vP "GenKinetics implementation of S1 + S2 => P"

  parameter Real S10 = 1.0 "initial concentration of S";
  parameter Real S20 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real kmS1 = 1.5 "kinetic parameter";
  parameter Real kmS2 = 0.3 "kinetic parameter";

  Substances.Dynamic.Substance S1(c_0=S10);
  Substances.Dynamic.Substance S2(c_0=S20);
  Substances.Dynamic.Substance P(c_0=0);

  ReactionTypes.IrrBiUni v(
    KmS={kmS1,kmS2},
    Vfwdmax=vfwd);

  Modelica.Blocks.Interfaces.RealOutput S1c annotation (
    Placement(visible = true, transformation(origin = {104, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation (
    Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput r annotation (
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput S2c annotation (
    Placement(visible = true, transformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

  connect(S1.rc, v.rc_S[1]);
  connect(S2.rc, v.rc_S[2]);
  connect(v.rc_P[1], P.rc);

  S1c = S1.c;
  S2c = S2.c;
  Pc = P.c;
  v.v = r;

  annotation (
    Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
end S1S2vP;
