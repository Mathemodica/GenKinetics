within GenKinetics.UnitTests.Internal;

model SvP
  Modelica.Blocks.Interfaces.RealOutput S annotation(
    Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P annotation(
    Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real km = 2.0 "kinetic parameter";
initial equation
  S = S0;
equation
  der(S) = -v;
  v = vfwd * S / km / (1 + S / km);
  der(P) = v;
  annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-10, Interval = 0.025));
end SvP;
