within GenKinetics.Reactions.LinLog.Dynamic;
model InhKinetic "Implementation of Linlog Kinetic with Inhibtion"
  extends ReactionTerm(redeclare final model Modifiers = InhibitionTerm(
   redeclare final model Activation = Interfaces.Dynamic.Modifier.NoActivation));
equation
  v = v_steady + R + I;
end InhKinetic;
