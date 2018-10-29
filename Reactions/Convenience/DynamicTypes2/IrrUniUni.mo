within GenKinetics.Reactions.Convenience.DynamicTypes2;
model IrrUniUni "S => P"
  extends Generic.Kinetic(redeclare final model Dimensionality =
      GenKinetics.Interfaces.Dynamic.Dimension.UniUni,
     redeclare final model Inhibition =
       GenKinetics.Interfaces.Dynamic.Modifier.NoInhibition,
     redeclare final model Activation =
       GenKinetics.Interfaces.Dynamic.Modifier.NoActivation,
     Reversible = false);
end IrrUniUni;
