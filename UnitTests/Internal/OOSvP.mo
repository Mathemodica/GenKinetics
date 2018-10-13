within GenKinetics.UnitTests.Internal;

model OOSvP

parameter GenKinetics.Units.AffinityConst km = 2.0; 
parameter GenKinetics.Units.Concentration S0 = 1.0; 
parameter Units.ReactionCoef vfwd = 1.0; 

NodeElements.Dynamic.Node  S(c_0=S0); 
NodeElements.Dynamic.Node  P; 
Reactions.Convenience.Dynamic.IrrKinetic v(KmS={km},Vfwdmax=vfwd);


equation 

  connect(S.rc,v.rc_S[1]); 
  connect(v.rc_P[1],P.rc); 
  
end OOSvP;
