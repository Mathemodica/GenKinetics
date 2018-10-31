within GenKinetics.UnitTests.Internal.Explicit;
model SIvP "Explicit implementation of S +  I => P"
  Modelica.Blocks.Interfaces.RealOutput S(start = S0) annotation (
    Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
    Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real I = 0.3;
  parameter Real kI = 0.77;
  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real km = 2.0 "kinetic parameter";
equation
  der(S) = -v;
  v =  kI / (kI + I) * vfwd * S / km / (1 + S / km);
  der(P) = v;
end SIvP;
