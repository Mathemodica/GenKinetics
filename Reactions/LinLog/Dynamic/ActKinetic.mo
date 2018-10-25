within GenKinetics.Reactions.LinLog.Dynamic;
model ActKinetic "Implementation of Linlog Kinetic with Activation"
  extends ReactionTerm(redeclare final model Modifiers = ActivationTerm(
   redeclare final model Inhibition = Interfaces.Dynamic.Modifier.NoInhibition));
equation
  v = v_steady + R + A;
end ActKinetic;
