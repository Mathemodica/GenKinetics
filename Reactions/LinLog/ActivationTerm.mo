within GenKinetics.Reactions.LinLog;
partial model ActivationTerm "Interface for activating a reaction"
  extends Interfaces.Reactions.Modifiers.Base.ActivationConnections;
  extends Reactions.ModifiersTerm;

  parameter Units.Elasticity gamma[NA] = zeros(NA) "elasticity coefficients";
  parameter Units.Concentration A0[NA] = ones(NA) "Substrate concentration at a reference steady state";

protected
  Units.VolumetricReactionRate A "activation term";

equation
  if NA > 0 then
    A = sum( gamma .* log(mc_A.c ./ A0));
  else
    A = 0;
  end if;
end ActivationTerm;
