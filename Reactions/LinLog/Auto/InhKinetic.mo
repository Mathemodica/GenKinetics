within GenKinetics.Reactions.LinLog.Auto;
model InhKinetic "Implementation of Linlog Kinetic with Inhibtion"
  import GenKinetics;
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.InhibitionTerm (redeclare final
          model Activation =
            GenKinetics.Interfaces.Reactions.Modifiers.Auto.NoActivation));
equation
  v = v_steady + R + I;
end InhKinetic;
