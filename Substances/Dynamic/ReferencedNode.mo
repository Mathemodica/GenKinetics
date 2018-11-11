within GenKinetics.Substances.Dynamic;
model ReferencedNode
  "Node with additional parameter for a value at reference steady state"
  extends Node;
  parameter Units.Concentration c_steady "concentration value at a reference steady state";
end ReferencedNode;
