within GenKinetics.Reactions.LinLog.Auto;
model ActKinetic "Implementation of Linlog Kinetic with Activation"
  import GenKinetics;
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.ActivationTerm (redeclare final
          model Inhibition =
            GenKinetics.Interfaces.Reactions.Modifiers.Auto.NoInhibition));
equation
  v = v_steady + R + A;
end ActKinetic;
