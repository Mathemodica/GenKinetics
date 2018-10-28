within GenKinetics;
package UnitTests
  extends Modelica.Icons.Package;





















  model TestLinLogKinetic
    
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real P0 = 0.1 "Initial concentration of P";
    
    parameter Real v_steady = 1.0 "reference steady-state reaction rate"; 
    
    parameter Real alpha = 1.0 "elasticity"; 
    parameter Real theta = -2.5 "elasticity";
    
    parameter Real S_steady = 0.1; 
    parameter Real P_steady = 0.1;  
    
    Internal.SvP_LinLog SR1(S0=S0,P0=P0,v_steady=v_steady,alpha=alpha,theta=theta,S_steady=S_steady,P_steady=P_steady) annotation(
      Placement(visible = true, transformation(origin = {-50, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Internal.OOSvP_LinLog SR2(S0=S0,P0=P0,v_steady=v_steady,alpha=alpha,theta=theta,S_steady=S_steady,P_steady=P_steady) annotation(
      Placement(visible = true, transformation(origin = {-46, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Internal.AssertContinuousTrajectory check(MaxAccErr = 1e-3, name = "Dynamic Node") annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR2.Sc, check.T2) annotation(
      Line(points = {{-35.8, -29.6}, {-4, -29.6}, {-4, -7.6}, {32.6, -7.6}}, color = {0, 0, 127}));
    connect(SR1.S, check.T1) annotation(
      Line(points = {{-40, 53.2}, {-4, 53.2}, {-4, 6.6}, {32.4, 6.6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestLinLogKinetic;


  annotation (
    Documentation(info = "<html><head></head><body>Package of unit tests for exisiting components. This package is making use of XgonyTest library. You can download the library from&nbsp;<a href=\"https://github.com/xogeny/XogenyTest\">https://github.com/xogeny/XogenyTest</a>. Please note if (some) unit tests are not compilable, then please use the newer version of XogenyTest downloadable at&nbsp;<a href=\"https://github.com/AtiyahElsheikh/XogenyTest\">https://github.com/AtiyahElsheikh/XogenyTest</a>.<div><br></div><div><br></div><div><br></div><div><br></div><div><p style=\"font-size: 12px;\">Licensed under the Modelica License 2</p><p style=\"font-size: 12px;\"><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\">GenKinetics.UserGuide.CopyRight</a></p><p style=\"font-size: 12px;\"><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:////Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));
end UnitTests;
