within GenKinetics.Interfaces.Static;
partial model Reaction2S "basic declaration of a reaction with two substrates"
  extends Reaction1S;
  GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S2 annotation (Placement(
      visible=true,
      transformation(extent={{-36,50},{-16,70}}, rotation=0),
      iconTransformation(extent={{-122,-22},{-82,18}}, rotation=0)));
end Reaction2S;
