within GenKinetics.UnitTests;
package Internal "Some explicit implementation of small reactions systems"
  extends Modelica.Icons.InternalPackage;





  model AssertContinuousTrajectory "Assert correctness of a whole solution trajectory"

    parameter Real MaxAccErr = 1e-3 "Maximum Accumulation Error";
    parameter String name = "" "Name of Test";

    XogenyTest.AssertContinuousTrajectory check(MaxAccErr=MaxAccErr,name=name);

    input Modelica.Blocks.Interfaces.RealInput T1 "First trajectory" annotation (
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    input Modelica.Blocks.Interfaces.RealInput T2 "Second trajectory" annotation (
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

    Modelica.Blocks.Interfaces.RealOutput Area "The area of the difference between the input trajectories" annotation (
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


  equation

    T1 = check.T1;
    T2 = check.T2;
    Area = check.Area;

    annotation (
      Documentation(info = "<html><head></head><body><div>A testing facitilty for ensuring the correctness of a continuous variabl.</div><div><br></div><div>Modification of the same component implemented in XogenyTest with additional icons from MSL for visual modeling since XogenyTest does not employ MSL.&nbsp;</div><div><br></div><br></body></html>"),
      Icon(graphics = {Rectangle(origin = {-14, -1}, lineColor = {0, 0, 127}, pattern = LinePattern.DashDotDot, extent = {{-86, 101}, {114, -99}})}));
  end AssertContinuousTrajectory;





  model SvP_rev "Explicit implementation of S <=> P"
    Modelica.Blocks.Interfaces.RealOutput S annotation (
      Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
      Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";
  initial equation
    S = S0;
  equation
    der(S) = -v;
    v = (vfwd * S / kmS  - vbwd * P / kmP)  / ( (1 + S / kmS) + (1 + P / kmP) - 1);
    der(P) = v;
  end SvP_rev;





  model OOSvP_rev "GenKinetics implementation of S <=> P"

    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

    NodeElements.Dynamic.Node S(c_0 = S0);
    NodeElements.Dynamic.Node P(c_0 = 0);
    Reactions.Convenience.Dynamic.RevKinetic v(KmS = {kmS}, KmP = {kmP}, Vfwdmax = vfwd, Vbwdmax=vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics = {Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOSvP_rev;






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






  model OOS1S2vP "GenKinetics implementation of S1 + S2 => P"

    parameter Real S10 = 1.0 "initial concentration of S";
    parameter Real S20 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real kmS1 = 1.5 "kinetic parameter";
    parameter Real kmS2 = 0.3 "kinetic parameter";

    NodeElements.Dynamic.Node S1(c_0 = S10);
    NodeElements.Dynamic.Node S2(c_0 = S20);
    NodeElements.Dynamic.Node P(c_0 = 0);

    Reactions.Convenience.Dynamic.IrrKinetic v(NS=2,KmS = {kmS1,kmS2}, Vfwdmax = vfwd);

    Modelica.Blocks.Interfaces.RealOutput S1c annotation (
      Placement(visible = true, transformation(origin = {104, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput S2c annotation (
      Placement(visible = true, transformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S1.rc, v.rc_S[1]);
    connect(S2.rc, v.rc_S[2]);
    connect(v.rc_P[1], P.rc);

    S1c = S1.c;
    S2c = S2.c;
    Pc = P.c;
    v.v = r;

    annotation (
      Icon(graphics = {Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOS1S2vP;






  model SIvP_rev "Explicit implementation of S + I <=> P"
    Modelica.Blocks.Interfaces.RealOutput S annotation (
      Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
      Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


    parameter Real I = 0.5 " fixed concentration of inhibitor";
    parameter Real kI = 0.5 "kinetic parameter";

    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

  initial equation
    S = S0;
  equation
    der(S) = -v;
    v = (kI / (kI + I))*(vfwd * S / kmS - vbwd * P / kmP) / ( 1 + S / kmS + 1 + P / kmP - 1);
    der(P) = v;
  end SIvP_rev;






  model OOSIvP_rev "GenKinetics implementation of S + I <=> P"


    parameter Real I0 = 0.5 " fixed concentration of inhibitor";
    parameter Real kI = 0.5 "kinetic parameter";
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

    NodeElements.Dynamic.FixedConcentrationNode I(c_0=I0);
    NodeElements.Dynamic.Node S(c_0 = S0);
    NodeElements.Dynamic.Node P(c_0 = 0);
    Reactions.Convenience.Dynamic.InhRevKinetic v(KmS = {kmS}, KmP = {kmP}, KI = {kI}, Vfwdmax = vfwd, Vbwdmax = vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_I[1],I.mc);

    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics = {Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOSIvP_rev;





  model SAvP "Explicit implementation of S + A => P"
    Modelica.Blocks.Interfaces.RealOutput S(start = S0) annotation (
      Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
      Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


    parameter Real A = 0.5 " fixed concentration of inhibitor";
    parameter Real kA = 0.5 "kinetic parameter";

    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real km = 2.0 "kinetic parameter";

  equation

    der(S) = -v;
    v = (kA + A)  / kA * vfwd * S / km / (1 + S / km);
    der(P) = v;

  end SAvP;





  model OOSAvP "GenKinetics implementation of S + A => P"

    parameter Real A0 = 0.5 " fixed concentration of inhibitor";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;

    NodeElements.Dynamic.Node S(c_0 = S0);
    NodeElements.Dynamic.Node P(c_0 = 0);
    NodeElements.Dynamic.FixedConcentrationNode A(c_0 = A0);

    Reactions.Convenience.Dynamic.ActIrrKinetic v(KmS = {km}, KA={kA},Vfwdmax = vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_A[1], A.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics = {Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOSAvP;







  annotation (
    Documentation(info = "<html><head></head><body>A package containing explicit implementation of some small reaction systems or biochemical reaction netwroks as references for unit tests&nbsp;</body></html>"));
end Internal;
