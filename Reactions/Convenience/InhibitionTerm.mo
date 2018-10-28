within GenKinetics.Reactions.Convenience;
partial model InhibitionTerm "Interface for inhibiting a reaction"
  extends GenKinetics.Reactions.ModifiersTerm;
  extends Interfaces.Dynamic.InhibitionConnections;
  parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";
protected
  Real I "inhibition term in the corresponding kinetics";
  Real Ic[NI];
equation
  Ic = mc_I.c;

  if NI > 0 then
    I = product(KI ./ (KI .+ Ic));
  else
    I = 1;
  end if;

end InhibitionTerm;
