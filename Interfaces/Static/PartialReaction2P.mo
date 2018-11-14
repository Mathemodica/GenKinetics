within GenKinetics.Interfaces.Static;
partial model PartialReaction2P
  "basic declaration of a reaction with two products"
  extends PartialReaction1P;
  GenKinetics.Interfaces.Nodes.ProductConnector rc_P2 annotation (Placement(
      visible=true,
      transformation(extent={{-50,6},{-10,46}}, rotation=0),
      iconTransformation(extent={{78,-22},{118,18}}, rotation=0)));
end PartialReaction2P;
