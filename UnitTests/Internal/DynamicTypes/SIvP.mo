within GenKinetics.UnitTests.Internal.DynamicTypes;
model SIvP "GenKinetics implementation of S +  I => P"

  parameter Real I0 = 0.3 "fixed concentration of inhibitor";
  parameter Real kI = 0.77;

  parameter GenKinetics.Units.AffinityConst km = 2.0;
  parameter GenKinetics.Units.Concentration S0 = 1.0;
  parameter Units.ReactionCoef vfwd = 1.0;
  Substances.Dynamic.Node S(c_0=S0);
  Substances.Dynamic.Node P(c_0=0);

  Substances.Dynamic.FixedConcentrationNode I(c_0=I0);
  ReactionTypes.IrrUniUniI1 v(
    KmS={km},
    KI={kI},
    Vfwdmax=vfwd);
  Modelica.Blocks.Interfaces.RealOutput Sc annotation (
    Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation (
    Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput r annotation (
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(S.rc, v.rc_S[1]);
  connect(v.rc_P[1], P.rc);
  connect(v.mc_I[1], I.mc);
  Sc = S.c;
  Pc = P.c;
  v.v = r;
  annotation (
    Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
end SIvP;
