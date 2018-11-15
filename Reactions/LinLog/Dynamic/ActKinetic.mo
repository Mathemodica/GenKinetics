within GenKinetics.Reactions.LinLog.Dynamic;
model ActKinetic "Implementation of Linlog Kinetic with Activation"
  import GenKinetics;
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.ActivationTerm (redeclare final
          model Inhibition =
            GenKinetics.Interfaces.Reactions.Modifiers.Base.NoInhibition));
equation
  v = v_steady + R + A;
end ActKinetic;
