within GenKinetics.UnitTests.Internal.Explicit;
model S1S2vP "Explicit implementation of S1 + S2 => P"
  Modelica.Blocks.Interfaces.RealOutput S1(start = S10) annotation (
    Placement(visible = true, transformation(origin = {104, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
    Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput S2(start = S20) annotation (
    Placement(visible = true, transformation(origin = {104, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  parameter Real S10 = 1.0 "initial concentration of S";
  parameter Real S20 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.0 "kinetic parameter";
  parameter Real kmS1 = 1.5 "kinetic parameter";
  parameter Real kmS2 = 0.3 "kinetic parameter";

equation

  der(S1) = -v;
  der(S2) = -v;
  v = vfwd * S1 / kmS1 * S2 / kmS2 / (1 + S1 / kmS1) / (1 + S2/kmS2);
  der(P) = v;

end S1S2vP;
