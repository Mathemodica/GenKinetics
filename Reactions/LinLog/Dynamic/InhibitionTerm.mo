within GenKinetics.Reactions.LinLog.Dynamic;
partial model InhibitionTerm
  "basic implementation of inhibiting a reaction"
  extends Interfaces.Dynamic.InhibitionConnections;
  extends Reactions.ModifiersTerm;

  parameter Real delta[NI] "elasticity coefficients";
  parameter Units.Concentration I0[NI] "Substrate concentration at a reference steady state";

protected
  Units.VolumetricReactionRate I "activation term";

equation
  I = sum( delta .* log(mc_I.c ./ I0));
end InhibitionTerm;
