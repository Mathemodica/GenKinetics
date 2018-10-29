within GenKinetics.Interfaces.Static;
partial model PartialReaction2S
  "basic declaration of a reaction with two substrates"
  extends PartialReaction1S;
  GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S2 annotation (Placement(
      visible=true,
      transformation(extent={{-36,50},{-16,70}}, rotation=0),
      iconTransformation(extent={{-122,-22},{-82,18}}, rotation=0)));
end PartialReaction2S;
