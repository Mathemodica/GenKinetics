  partial model ReactionDimension "Dimension and structure of a reaction"
    parameter Integer NS = 1 "number of substrates";
    parameter Units.StoichiometricCoef n_S[NS] = ones(NS) "stoichiometry of all subtrates";
    parameter Integer NP = 1 "number of products";
    parameter Units.StoichiometricCoef n_P[NP] = ones(NP) "stoichiometry of all products";
  end ReactionDimension;
