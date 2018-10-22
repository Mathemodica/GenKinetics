within GenKinetics.Interfaces.Static;
partial model Reaction1S "basic declaration of a reaction with one substrate"
  extends GenKinetics.Icons.Reaction;
  GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S1 annotation (Placement(
      visible=true,
      transformation(extent={{-36,50},{-16,70}}, rotation=0),
      iconTransformation(extent={{-20,80},{20,120}}, rotation=0)));
end Reaction1S;
