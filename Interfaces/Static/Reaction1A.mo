within GenKinetics.Interfaces.Static;
partial model Reaction1A "interface for activating a reaction"
  extends GenKinetics.Icons.Reaction;
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A1 annotation (
      Placement(
      visible=true,
      transformation(extent={{-40,80},{0,120}}, rotation=0),
      iconTransformation(extent={{-120,76},{-80,116}}, rotation=0)));

end Reaction1A;
