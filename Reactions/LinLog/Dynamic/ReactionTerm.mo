within GenKinetics.Reactions.LinLog.Dynamic;
partial model ReactionTerm "Basic reaction terms in linlog kinetics "
  extends BasicReaction(ref_steady_state = true);

  parameter Real alpha[NS] "elasticity coefficients";
  parameter Real theta[NP] "elasticity coefficients";

  parameter Units.Concentration S0[NS] "Substrate Concentration at a reference steady state";
protected
  Real R;

equation



end ReactionTerm;
