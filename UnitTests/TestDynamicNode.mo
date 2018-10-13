within GenKinetics.UnitTests;

model TestDynamicNode

XogenyTest.AssertContinuousTrajectory check(MaxAccErr = 1e-3); 
Internal.SvP StoP; 

parameter Real km = 2.0; 
parameter Real S0 = 1.0; 
parameter Real vfwd = 1.0; 

NodeElements.Dynamic.Node  S; 
NodeElements.Dynamic.Node  P; 
Reactions.Convenience.Dynamic.IrrKinetic v;


equation 

  connect(S.rc,v.rc_S[1]); 
  connect(v.rc_P[1],P.rc); 

end TestDynamicNode;
