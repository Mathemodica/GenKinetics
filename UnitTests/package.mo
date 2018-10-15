within GenKinetics;
package UnitTests
  extends Modelica.Icons.Package;





  model TestDynamicIrrKinetic
    parameter Real km = 2.0;
    parameter Real S0 = 1.0;
    parameter Real vfwd = 1.0;
    Internal.SvP SR1(km = km, S0 = S0, vfwd = vfwd) annotation(
      Placement(visible = true, transformation(origin = {-50, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Internal.OOSvP SR2(km = km, S0 = S0, vfwd = vfwd) annotation(
      Placement(visible = true, transformation(origin = {-46, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Internal.AssertContinuousTrajectory check(MaxAccErr = 1e-3, name = "Dynamic Irreversible Kinetic") annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR2.r, check.T2) annotation(
      Line(points = {{-36, -36}, {-2, -36}, {-2, -8}, {32, -8}}, color = {0, 0, 127}));
    connect(SR1.v, check.T1) annotation(
      Line(points = {{-40, 46}, {-2, 46}, {-2, 6}, {32, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestDynamicIrrKinetic;

  annotation (
    Documentation(info = "<html><head></head><body>Package of unit tests for exisiting components. This package is making use of XgonyTest library. You can download the library from&nbsp;<a href=\"https://github.com/xogeny/XogenyTest\">https://github.com/xogeny/XogenyTest</a>. Please note if (some) unit tests are not compilable, then please use the newer version of XogenyTest downloadable at&nbsp;<a href=\"https://github.com/AtiyahElsheikh/XogenyTest\">https://github.com/AtiyahElsheikh/XogenyTest</a>.</body></html>"));
end UnitTests;
