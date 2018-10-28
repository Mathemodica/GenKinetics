within GenKinetics.Reactions.Convenience.Dynamic;
package Deprecated "Old implementation"
  model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
    // extends GenKinetics.Reactions.Convenience.Dynamic.IrrReactionTerm;
    extends GenKinetics.Reactions.Convenience.Dynamic.Deprecated.IrrReactionTerm(redeclare
        final model
              Reversibility =      Interfaces.Reversible.OneWay);
  equation
    v = S1 / S2;
  end IrrKinetic;

  model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.IrrReactionTerm(
                                                                      redeclare
        final model Modifiers = InhibitionTerm(redeclare final model Activation
            =
          Interfaces.Dynamic.Modifier.NoActivation));

  equation
    v = I * S1 / S2;
  end InhIrrKinetic;

  model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.IrrReactionTerm(
                                                                       redeclare
        final model Modifiers = ActivationTerm(redeclare final model Inhibition
            =
          Interfaces.Dynamic.Modifier.NoInhibition));
  equation
    v = A * S1 / S2;
  end ActIrrKinetic;

  model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.IrrReactionTerm(
        redeclare final model Modifiers = ActivationAndInhibitionTerms);
  equation
    v = A * I * S1 / S2;
  end ActInhIrrKinetic;

  model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
      extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.RevReactionTerm;
  equation
    v = (S1 - P1) / (S2 + P2 - 1);
  end RevKinetic;

  model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.RevReactionTerm(
                                                                       redeclare
        final model Modifiers = InhibitionTerm(redeclare final model Activation
            =
          Interfaces.Dynamic.Modifier.NoActivation));
  equation
    v = I * (S1 - P1) / (S2 + P2 - 1);
  end InhRevKinetic;

  model ActRevKinetic "S1 + S2 + ...  <==A1,A2,...==> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.RevReactionTerm(
                                                                       redeclare
        final model Modifiers = ActivationTerm(redeclare final model Inhibition
            =
          Interfaces.Dynamic.Modifier.NoInhibition));
  equation
    v = A * (S1 - P1) / (S2 + P2 - 1);
  end ActRevKinetic;

  model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.RevReactionTerm(
      redeclare final model Modifiers = ActivationAndInhibitionTerms);
  equation
    v = A * I * (S1 - P1) / (S2 + P2 - 1);
  end ActInhRevKinetic;

  partial model ActivationTerm "Interface for activating a reaction"
    extends Interfaces.Dynamic.ActivationConnections;
    extends Reactions.ModifiersTerm;
    parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
  protected
    Real A "activation term";
  equation
    A = product((KA .+ mc_A.c) ./ KA);
  end ActivationTerm;

  partial model InhibitionTerm "Interface for inhibiting a reaction"
    extends GenKinetics.Reactions.ModifiersTerm;
    extends Interfaces.Dynamic.InhibitionConnections;
    parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";
  protected
    Real I "inhibition term in the corresponding kinetics";
    Real Ic[NI];
  equation
    Ic = mc_I.c;
    I = product(KI ./ (KI .+ Ic));
  end InhibitionTerm;

  partial model ActivationAndInhibitionTerms
    extends Deprecated.ActivationTerm;
    extends Deprecated.InhibitionTerm;
  end ActivationAndInhibitionTerms;

  partial model IrrReactionTerm
    "basic implementation of an irreversible reaction "
    extends GenKinetics.Reactions.BasicIrrReaction;

    parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";
    parameter Units.ReactionCoef Vfwdmax = 1 "maximal forward reaction rate";

  protected
    Real S1 "Kinetic terms";
    Real S2;
    Real cS[NS];

  equation

    cS = rc_S.c;
    S1 = Vfwdmax * product(cS ./ KmS);
    S2 = product(cS ./ KmS .+ 1);

  end IrrReactionTerm;

  partial model RevReactionTerm "basic declaration of a reversible reaction "
    import GenKinetics;
    extends
      GenKinetics.Reactions.Convenience.Dynamic.Deprecated.IrrReactionTerm(
                            redeclare final model Reversibility =
          Interfaces.Reversible.TwoWay);

    parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";
    parameter Units.ReactionCoef Vbwdmax = 1 "backward maximal reaction rate";

  protected
    Real P1;
    Real P2;
    Real Pc[NP];

  equation

    Pc = rc_P.c;
    P1 = Vbwdmax * product(Pc ./ KmP);
    P2 = product(Pc ./ KmP .+ 1);

  end RevReactionTerm;
end Deprecated;
