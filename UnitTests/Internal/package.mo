within GenKinetics.UnitTests;
package Internal "Some explicit implementation of small reactions systems"
  extends Modelica.Icons.InternalPackage;

































  model SvP_LinLog "Explicit implementation of S <=> P with linlog kinetic"
    Modelica.Blocks.Interfaces.RealOutput S annotation(
      Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation(
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation(
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
    v = v_steady + alpha * log(S/S_steady) + theta * log(P/P_steady) ;
    der(P) = v;
  end SvP_LinLog;

































  model OOSvP_LinLog "GenKinetics implementation of S => P"
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real P0 = 0.1 "Initial concentration of P";
    
    parameter Real v_steady = 1.0 "reference steady-state reaction rate"; 
    
    parameter Real alpha = 1.0 "elasticity"; 
    parameter Real theta = -2.5 "elasticity";
    
    parameter Real S_steady = 0.1; 
    parameter Real P_steady = 0.1;  
    
    NodeElements.Dynamic.ReferencedNode S(c_0 = S0,c_steady = S_steady);
    NodeElements.Dynamic.ReferencedNode P(c_0 = P0,c_steady = P_steady);
    Reactions.LinLog.Dynamic.Kinetic v(NS = 1, NP = 1,v_steady = v_steady,alpha = {alpha}, theta = {theta},S0 = {S_steady} , P0 = {P_steady});
    Modelica.Blocks.Interfaces.RealOutput Sc annotation(
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation(
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation(
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation(
      Icon(graphics = {Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOSvP_LinLog;



  annotation (
    Documentation(info = "<html><head></head><body>A package containing explicit implementation of some small reaction systems or biochemical reaction netwroks as references for unit tests&nbsp;</body></html>"));
end Internal;
