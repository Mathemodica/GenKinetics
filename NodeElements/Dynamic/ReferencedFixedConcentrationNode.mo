within GenKinetics.NodeElements.Dynamic;
model ReferencedFixedConcentrationNode
  "additional parameter for a value at a referenced steady state "
  extends FixedConcentrationNode;
  parameter Units.Concentration c_steady "concentration value at a reference steady state";

end ReferencedFixedConcentrationNode;
