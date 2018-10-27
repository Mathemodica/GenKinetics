within GenKinetics.Reactions.Convenience.Generic;
partial model ActivationTerm "Interface for activating a reaction"
  extends Interfaces.Dynamic.ActivationConnections;
  extends Reactions.ModifiersTerm;
  parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
protected
  Real A "activation term";
equation
  if NA > 0 then
    A = product((KA .+ mc_A.c) ./ KA);
  else
    A = 1;
  end if;
end ActivationTerm;
