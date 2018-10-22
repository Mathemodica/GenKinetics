within GenKinetics.NodeElements.Dynamic;
model FixedConcentrationNode "Metabolite with fixed concentration"
  extends GenKinetics.NodeElements.Dynamic.BasicNode;
equation
  c = c_0;
end FixedConcentrationNode;
