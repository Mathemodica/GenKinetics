within GenKinetics.Reactions.Convenience;
package Auto
  extends Modelica.Icons.VariantsPackage;

  model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
    // extends GenKinetics.Reactions.Convenience.Dynamic.IrrReactionTerm;
    extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare final
        model Reversibility = Interfaces.Reactions.Basics.Reversible.OneWay);
  equation
    v = S1 / S2;
  end IrrKinetic;

  model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare
        replaceable model Modifiers = Convenience.InhibitionTerm (redeclare
            final model Activation =
              Interfaces.Reactions.Modifiers.Auto.NoActivation), redeclare
        final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.OneWay);

  equation

    v = I * S1 / S2;

  end InhIrrKinetic;

  model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare final
        model Modifiers = Convenience.ActivationTerm (redeclare final model
            Inhibition = Interfaces.Reactions.Modifiers.Auto.NoInhibition),
        redeclare final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.OneWay);
  equation
    v = A * S1 / S2;
  end ActIrrKinetic;

  model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare final
        model Modifiers = Reactions.Convenience.ActivationAndInhibitionTerms,
        redeclare final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.OneWay);
  equation
    v = A * I * S1 / S2;
  end ActInhIrrKinetic;

  model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
        model Reversibility = Interfaces.Reactions.Basics.Reversible.TwoWays);
  equation
    v = (S1 - P1) / (S2 + P2 - 1);
  end RevKinetic;

  model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
        model Modifiers = Convenience.InhibitionTerm (redeclare final model
            Activation = Interfaces.Reactions.Modifiers.Auto.NoActivation),
        redeclare final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.TwoWays);
  equation
    v = I * (S1 - P1) / (S2 + P2 - 1);
  end InhRevKinetic;

  model ActRevKinetic "S1 + S2 + ...  <==A1,A2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
        model Modifiers = Convenience.ActivationTerm (redeclare final model
            Inhibition = Interfaces.Reactions.Modifiers.Auto.NoInhibition),
        redeclare final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.TwoWays);
  equation
    v = A * (S1 - P1) / (S2 + P2 - 1);
  end ActRevKinetic;

  model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
        model Modifiers = Convenience.ActivationAndInhibitionTerms, redeclare
        final model Reversibility =
          Interfaces.Reactions.Basics.Reversible.TwoWays);
  equation
    v = A * I * (S1 - P1) / (S2 + P2 - 1);
  end ActInhRevKinetic;
  annotation (
    Documentation(info = "<html><head></head><body><h2><font size=\"3\">Reactions with parameterized number of connections suitable for model generation and textual implementation</font></h2><p style=\"font-size: 12px;\"><strong><u>Information</u></strong></p><div class=\"textDoc\"><p style=\"font-family: 'Courier New'; font-size: 12px;\"></p></div><div class=\"htmlDoc\"><p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));
end Auto;
