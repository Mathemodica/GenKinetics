within GenKinetics.Interfaces.Static;
partial model Reaction1P "basic declaration of a reaction with one product"
  extends GenKinetics.Icons.Reaction;
  GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P1 annotation (Placement(
      visible=true,
      transformation(extent={{-50,6},{-10,46}}, rotation=0),
      iconTransformation(extent={{-22,-112},{18,-72}}, rotation=0)));
end Reaction1P;
