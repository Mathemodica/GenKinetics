within GenKinetics.Reactions.Convenience.Dynamic;

package Deprecated
  extends Modelica.Icons.InternalPackage;

  partial model ReactionActivation "Interface for activating a reaction"
    parameter Integer NA = 1 "number of Metabolites activating the reaction";
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A[NA] "connectors to the activating node";
    parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
  protected
    Real A "activation term";
  equation
    A = product((KA .+ mc_A.c) ./ KA);
  end ReactionActivation;

  partial model BasicIrrReaction "basic declaration of an irreversible reaction "
    extends Reactions.Convenience.Dynamic.BasicReaction;
    //  extends Reactions.Convenience.Dynamic.BasicActivator;
    parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";
  protected
    Real S1 "Kinetic terms";
    Real S2;
  equation
// S1 = Vfwdmax * product({rc_S[i].c / KmS[i] for i in 1:NS});
// S2 = product({rc_S[i].c / KmS[i] + 1 for i in 1:NS});
    S1 = Vfwdmax * product(rc_S.c ./ KmS);
    S2 = product(rc_S.c ./ KmS .+ 1);
  end BasicIrrReaction;

  model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
  equation
    v = S1 / S2;
  end IrrKinetic;

  model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
  equation
    v = A * S1 / S2;
  end ActIrrKinetic;

  partial model BasicRevReaction "basic declaration of a reversible reaction "
    extends Reactions.Convenience.Dynamic.BasicIrrReaction(redeclare replaceable class Reversibility = Interfaces.Reversible.TwoWay);
    parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";
  protected
    Real P1;
    Real P2;
  equation
    P1 = Vbwdmax * product(rc_P.c ./ KmP);
    P2 = product(rc_P.c ./ KmP .+ 1);
  end BasicRevReaction;

  partial model ReactionInhibition "Interface for inhibiting a reaction"
    parameter Integer NI = 1 "number of Metabolites inhibiting the reaction";
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I[NI] "connection to inhibitors";
    parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";
  protected
    Real I "inhibition term in the corresponding kinetics";
  equation
    I = product(KI ./ (KI .+ mc_I.c));
  end ReactionInhibition;

  model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionInhibition;
  equation
    v = I * S1 / S2;
  end InhIrrKinetic;

  model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionActivation;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionInhibition;
  equation
    v = A * I * S1 / S2;
  end ActInhIrrKinetic;

  model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction;
  equation
    v = (S1 - P1) / (S2 + P2 - 1);
  end RevKinetic;

  model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionInhibition;
  equation
    v = I * (S1 - P1) / (S2 + P2 - 1);
  end InhRevKinetic;

  model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionActivation;
    extends GenKinetics.Reactions.Convenience.Dynamic.ReactionInhibition;
  equation
    v = A * I * (S1 - P1) / (S2 + P2 - 1);
  end ActInhRevKinetic;
end Deprecated;
