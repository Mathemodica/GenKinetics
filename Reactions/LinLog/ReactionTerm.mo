within GenKinetics.Reactions.LinLog;
partial model ReactionTerm "Basic reaction terms in linlog kinetics "
  extends BasicReferencedReaction;

  parameter Real alpha[NS] = zeros(NS) "elasticity coefficients";
  parameter Real theta[NP] = zeros(NP) "elasticity coefficients";

  parameter Units.Concentration S0[NS] = ones(NS) "Substrate concentration at a reference steady state";
  parameter Units.Concentration P0[NP] = ones(NP) "Product concentration at a reference steady state";

protected
  Units.VolumetricReactionRate R;

equation

  R =  sum( alpha .* log(rc_S.c ./ S0))  + sum( theta .* log(rc_P.c ./ P0));

end ReactionTerm;
