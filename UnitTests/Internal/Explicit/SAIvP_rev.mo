within GenKinetics.UnitTests.Internal.Explicit;
model SAIvP_rev "Explicit implementation of S + A + I <=> P"
  Modelica.Blocks.Interfaces.RealOutput S(start = S0) annotation (
    Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
    Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real I = 0.3;
  parameter Real kI = 0.77;
  parameter Real A = 0.5 " fixed concentration of inhibitor";
  parameter Real kA = 0.5 "kinetic parameter";
  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmP = 0.77 "kinetic parameter";
equation
  der(S) = -v;
  v = (kA + A) / kA * kI / (kI + I) * (vfwd * S / kmS - vbwd * P / kmP)  / ((1 + S / kmS) + (1 + P / kmP) - 1);
  der(P) = v;
end SAIvP_rev;
