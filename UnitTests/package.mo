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





  model TestDynamicRevKinetic
  
    parameter Real S0 = 1.0;
    parameter Real vfwd = 1.0;
    parameter Real vbwd = 0.5 "kinetic parameter"; 
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";
     
    Internal.AssertContinuousTrajectory check(MaxAccErr = 1e-3, name = "Dynamic Reversible Kinetic") annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GenKinetics.UnitTests.Internal.OOSvP_rev SR1(S0=S0,vfwd=vfwd,vbwd=vbwd,kmS=kmS,kmP=kmP) "Simple Reversible Reaction" annotation(
      Placement(visible = true, transformation(origin = {-54, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.SvP_rev SR2(S0=S0,vfwd=vfwd,vbwd=vbwd,kmS=kmS,kmP=kmP) "Simple Reversible Reaction" annotation(
      Placement(visible = true, transformation(origin = {-44, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR2.v, check.T2) annotation(
      Line(points = {{-34, -48}, {-6, -48}, {-6, -8}, {32, -8}}, color = {0, 0, 127}));
    connect(SR1.r, check.T1) annotation(
      Line(points = {{-44, 44}, {-14, 44}, {-14, 6}, {32, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestDynamicRevKinetic;







  model TestDynamicIrrKinetic2SvP
  
    parameter Real S10 = 1.0 "initial concentration of S";
    parameter Real S20 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real kmS1 = 1.5 "kinetic parameter";
    parameter Real kmS2 = 0.3 "kinetic parameter";
    
    GenKinetics.UnitTests.Internal.AssertContinuousTrajectory check1(MaxAccErr = 1e-3, name = "Dynamic Irreversible Kinetic S1 + S2 => P") annotation(
      Placement(visible = true, transformation(origin = {46, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.OOS1S2vP SR1(S10=S10,S20=S20,vfwd=vfwd,kmS1=kmS1,kmS2=kmS2) "Simple Reaction S1 + S2 => P" annotation(
      Placement(visible = true, transformation(origin = {-34, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.S1S2vP SR2(S10=S10,S20=S20,vfwd=vfwd,kmS1=kmS1,kmS2=kmS2) "Explicit Simple Reaction S1 + S2 => P" annotation(
      Placement(visible = true, transformation(origin = {-54, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.AssertContinuousTrajectory check2 annotation(
      Placement(visible = true, transformation(origin = {50, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR2.v, check1.T2) annotation(
      Line(points = {{-44, -46}, {-8, -46}, {-8, -68}, {37, -68}}, color = {0, 0, 127}));
    connect(SR1.r, check1.T1) annotation(
      Line(points = {{-24, 50}, {-8, 50}, {-8, -53}, {36, -53}}, color = {0, 0, 127}));
    connect(SR2.S1, check2.T2) annotation(
      Line(points = {{-44, -38}, {10, -38}, {10, 50}, {40, 50}}, color = {0, 0, 127}));
    connect(SR1.S1c, check2.T1) annotation(
      Line(points = {{-24, 58}, {4, 58}, {4, 64}, {40, 64}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestDynamicIrrKinetic2SvP;








  model TestDynamicInhRevKinetic
  
    
    parameter Real I = 0.5 " fixed concentration of inhibitor"; 
    parameter Real kI = 0.5 "kinetic parameter"; 
    
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";
    
    
    Internal.AssertContinuousTrajectory check(MaxAccErr = 1e-3, name = "Dynamic Inhibited Reversible Kinetic") annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.OOSIvP_rev SR1(I0=I,kI=kI,S0=S0,vfwd=vfwd,vbwd=vbwd,kmS=kmS,kmP=kmP) "Simple Reaction" annotation(
      Placement(visible = true, transformation(origin = {-54, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.SIvP_rev SR2(I=I,kI=kI,S0=S0,vfwd=vfwd,vbwd=vbwd,kmS=kmS,kmP=kmP) "Simple reaction" annotation(
      Placement(visible = true, transformation(origin = {-54, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR2.v, check.T2) annotation(
      Line(points = {{-44, -58}, {-6, -58}, {-6, -8}, {32, -8}}, color = {0, 0, 127}));
    connect(SR1.r, check.T1) annotation(
      Line(points = {{-44, 46}, {-8, 46}, {-8, 6}, {32, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestDynamicInhRevKinetic;





  model TestDynamicActIrrKinetic
  
    parameter Real A = 0.5 " fixed concentration of inhibitor"; 
    parameter Real kA = 0.5 "kinetic parameter";  
    
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real km = 2.0 "kinetic parameter";
  
    Internal.AssertContinuousTrajectory check(MaxAccErr = 1e-3, name = "Dynamic Node") annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.SAvP SR1(A=A,kA=kA,S0=S0,vfwd=vfwd,km=km) annotation(
      Placement(visible = true, transformation(origin = {-54, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.OOSAvP SR2(A0=A,kA=kA,S0=S0,vfwd=vfwd,km=km) annotation(
      Placement(visible = true, transformation(origin = {-58, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(SR1.v, check.T1) annotation(
      Line(points = {{-44, 38}, {-2, 38}, {-2, 6}, {32, 6}}, color = {0, 0, 127}));
    connect(SR2.r, check.T2) annotation(
      Line(points = {{-48, -58}, {-2, -58}, {-2, -8}, {32, -8}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
  end TestDynamicActIrrKinetic;

  annotation (
    Documentation(info = "<html><head></head><body>Package of unit tests for exisiting components. This package is making use of XgonyTest library. You can download the library from&nbsp;<a href=\"https://github.com/xogeny/XogenyTest\">https://github.com/xogeny/XogenyTest</a>. Please note if (some) unit tests are not compilable, then please use the newer version of XogenyTest downloadable at&nbsp;<a href=\"https://github.com/AtiyahElsheikh/XogenyTest\">https://github.com/AtiyahElsheikh/XogenyTest</a>.</body></html>"));
end UnitTests;
