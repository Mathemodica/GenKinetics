within GenKinetics.Substances.Dynamic;
model FixedConcentrationNode "Metabolite with fixed concentration"
  extends GenKinetics.Substances.Dynamic.BasicNode;
equation
  c = c_0;
end FixedConcentrationNode;
