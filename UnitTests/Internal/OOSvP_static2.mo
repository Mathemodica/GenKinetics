within GenKinetics.UnitTests.Internal;
model OOSvP_static2 "GenKinetics implementation of S => P"

parameter GenKinetics.Units.AffinityConst km = 2.0;
parameter GenKinetics.Units.Concentration S0 = 1.0;
parameter Units.ReactionCoef vfwd = 1.0;

  NodeElements.Static.Node S(c_0=S0);
  NodeElements.Static.Node P(c_0=0);
  Reactions.Convenience.Static.IrrUniUni v(km=km, Vmax=vfwd);
  Modelica.Blocks.Interfaces.RealOutput Sc annotation (
    Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation (
    Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput r annotation (
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

  connect(S.rc1,v.rc_S1);
  connect(v.rc_P1,P.rc2);

  Sc = S.c;
  Pc = P.c;
  v.kinetic.v = r;

annotation (
    Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
end OOSvP_static2;
