within GenKinetics.Interfaces.Dynamic.Dimension;
partial model ReactionDimension "Dimension of a reaction"
  parameter Integer NS "number of substrates";
  parameter Units.StoichiometricCoef n_S[NS] = ones(NS) "stoichiometry of all subtrates";
  parameter Integer NP  "number of products";
  parameter Units.StoichiometricCoef n_P[NP] = ones(NP) "stoichiometry of all products";
end ReactionDimension;
