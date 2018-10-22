within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicInhibitor "Interface for inhibiting a reaction"
  extends BasicModifier;
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I[NI]
    "connection to inhibitors";
  parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";

protected
  Real I "inhibition term in the corresponding kinetics";
  Real Ic[NI]; 

equation

  Ic = mc_I.c; 
  I = product(KI ./ (KI .+ Ic));

end BasicInhibitor;
