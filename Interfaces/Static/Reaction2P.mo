within GenKinetics.Interfaces.Static;
partial model Reaction2P "basic declaration of a reaction with two products"
  extends Reaction1P;
  GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P2 annotation (Placement(
      visible=true,
      transformation(extent={{-50,6},{-10,46}}, rotation=0),
      iconTransformation(extent={{78,-22},{118,18}}, rotation=0)));
end Reaction2P;
