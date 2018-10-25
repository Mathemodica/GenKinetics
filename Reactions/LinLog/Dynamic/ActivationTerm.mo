within GenKinetics.Reactions.LinLog.Dynamic;
partial model ActivationTerm "Interface for activating a reaction"
  extends Interfaces.Dynamic.ActivationConnections;
  extends Reactions.ModifiersTerm;

  parameter Real gamma[NA] "elasticity coefficients";
  parameter Units.Concentration A0[NA] "Substrate concentration at a reference steady state";

protected
  Units.VolumetricReactionRate A "activation term";

equation
  A = sum( gamma .* log(mc_A.c ./ A0));
end ActivationTerm;
