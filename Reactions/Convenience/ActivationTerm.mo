within GenKinetics.Reactions.Convenience;
partial model ActivationTerm "Activation term within the kinetic law"
  extends Interfaces.Reactions.Modifiers.Auto.ActivationConnections;
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
