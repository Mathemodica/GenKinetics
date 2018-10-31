within GenKinetics.UnitTests.Internal.Explicit;
model SvP_LinLog "Explicit implementation of S <=> P with linlog kinetic"
  Modelica.Blocks.Interfaces.RealOutput S annotation (
    Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
    Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real P0 = 0.1 "Initial concentration of P";

  parameter Real v_steady = 1.0 "reference steady-state reaction rate";

  parameter Real alpha = 1.0 "elasticity";
  parameter Real theta = -2.5 "elasticity";

  parameter Real S_steady = 0.1;
  parameter Real P_steady = 0.1;

initial equation
  S = S0;
  P = P0;
equation
  der(S) = -v;
  v = v_steady + alpha * log(S/S_steady) + theta * log(P/P_steady);
  der(P) = v;
end SvP_LinLog;
