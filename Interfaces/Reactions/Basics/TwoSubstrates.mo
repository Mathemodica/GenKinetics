within GenKinetics.Interfaces.Reactions.Basics;
partial model TwoSubstrates
  "basic declaration of a reaction with two substrates"
  extends Reactions.Basics.OneSubstrate;
  GenKinetics.Interfaces.Nodes.SubstrateConnector rc_S2 annotation (Placement(
      visible=true,
      transformation(extent={{-36,50},{-16,70}}, rotation=0),
      iconTransformation(extent={{-122,-22},{-82,18}}, rotation=0)));
end TwoSubstrates;
