within GenKinetics.Reactions.Convenience.Dynamic;
partial model InhibitionTerm "Interface for inhibiting a reaction"
  import GenKinetics;
  extends GenKinetics.Reactions.ModifiersTerm;
  extends Interfaces.Dynamic.InhibitionConnections;
  parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";
protected
  Real I "inhibition term in the corresponding kinetics";
  Real Ic[NI];
equation
  Ic = mc_I.c;
  I = product(KI ./ (KI .+ Ic));
end InhibitionTerm;
