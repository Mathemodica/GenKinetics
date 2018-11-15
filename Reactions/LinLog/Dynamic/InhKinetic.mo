within GenKinetics.Reactions.LinLog.Dynamic;
model InhKinetic "Implementation of Linlog Kinetic with Inhibtion"
  import GenKinetics;
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.InhibitionTerm (redeclare final
          model Activation =
            GenKinetics.Interfaces.Reactions.Modifiers.Base.NoActivation));
equation
  v = v_steady + R + I;
end InhKinetic;
